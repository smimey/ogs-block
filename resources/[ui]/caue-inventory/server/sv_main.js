/*

    Variables

*/

let DataEntries = 0;
let hasBrought = [];

/*

    Functions

*/

function db(string) {
    exports.ghmattimysql.execute(string, {});
};

function makeid(length) {
    var result = '';
    var characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghikjlmnopqrstuvwxyz'; //abcdef
    var charactersLength = characters.length;
    for (var i = 0; i < length; i++) {
        result += characters.charAt(Math.floor(Math.random() * charactersLength));
    }
    return result;
};

function GenerateInformation(player, itemid, itemdata) {
    let data = Object.assign({}, itemdata);
    let returnInfo = "{}"

    return new Promise((resolve, reject) => {
        if (itemid == "") return resolve(returninfo);

        let timeout = 0;

        if (!isNaN(itemid)) {
            var identifier = Math.floor((Math.random() * 99999) + 1)
            var ammo = 0

            if (itemdata && itemdata.fakeWeaponData) {
                identifier = Math.floor((Math.random() * 99999) + 1)
                identifier = identifier.toString()
            }

            if (itemdata && itemdata.ammo) {
                ammo = itemdata.ammo
            }

            // should I remove that?
            let cartridgeCreated = makeid(3) + "-" + Math.floor((Math.random() * 999) + 1);
            returnInfo = JSON.stringify({
                _hideKeys: ["cartridge"],
                cartridge: cartridgeCreated,
                serial: identifier,
                ammo: ammo,
            })

            timeout = 1;
            clearTimeout(timeout)
            return resolve(returnInfo);
        } else if (Object.prototype.toString.call(itemid) === '[object String]') {
            switch (itemid.toLowerCase()) {
                case "idcard":
                    if (itemdata == itemdata.fake) {
                        returnInfo = JSON.stringify({
                            identifier: itemdata,
                            charID,
                            Name: itemdata.first.replace(/[^\w\s]/gi, ''),
                            Surname: itemdata.last.replace(/[^\w\s]/gi, ''),
                            Sex: itemdata.sex,
                            DOB: itemdata.dob
                        })
                        timeout = 1
                        clearTimeout(timeout)
                        return resolve(returnInfo);
                    } else {
                        let string = `SELECT first_name, last_name, gender, dob FROM characters WHERE id = '${player}'`;
                        exports.ghmattimysql.execute(string, {}, function (result) {
                            let gender = "Homem"
                            if (result[0].gender === 1) {
                                gender = "Mulher"
                            }

                            returnInfo = JSON.stringify({
                                ["ID"]: player.toString(),
                                ["Nome"]: result[0].first_name.replace(/[^\w\s]/gi, ''),
                                ["Sobrenome"]: result[0].last_name.replace(/[^\w\s]/gi, ''),
                                ["Sexo"]: gender,
                                ["Data de Nascimento"]: result[0].dob
                            })

                            timeout = 1
                            clearTimeout(timeout)
                            return resolve(returnInfo);
                        });
                    }
                    break;
                case "pdbadge":
                    let string = `SELECT c.first_name, c.last_name, c.job, (CASE WHEN m.image IS NULL THEN "0" ELSE m.image END) AS image, gr.name AS rank_name, (CASE WHEN j.callsign IS NULL THEN "000" ELSE j.callsign END) AS callsign FROM characters c INNER JOIN groups_members gm ON (gm.cid = c.id AND gm.group = c.job) INNER JOIN groups_ranks gr ON (gr.group = c.job AND gr.rank = gm.rank) LEFT JOIN mdt_profiles m ON m.cid = c.id LEFT JOIN jobs_callsigns j ON (j.cid = c.id AND j.job = c.job) WHERE c.id = '${player}'`;
                    exports.ghmattimysql.execute(string, {}, function (result) {
                        returnInfo = JSON.stringify({
                            ["_hideKeys"]: ["image", "job"],
                            ["Nome"]: result[0].first_name.replace(/[^\w\s]/gi, ''),
                            ["Sobrenome"]: result[0].last_name.replace(/[^\w\s]/gi, ''),
                            ["Rank"]: result[0].rank_name,
                            ["Callsign"]: result[0].callsign,
                            ["image"]: result[0].image,
                            ["job"]: result[0].job,
                        })
                        timeout = 1
                        clearTimeout(timeout)
                        return resolve(returnInfo);
                    });
                    break;
                case "drivingtest":
                    if (data.id) {
                        let string = `SELECT * FROM driving_tests WHERE id = '${data.id}'`;
                        exports.ghmattimysql.execute(string, {}, function (result) {
                            if (result[0]) {
                                let ts = new Date(parseInt(result[0].timestamp) * 1000)
                                let testDate = ts.getFullYear() + "-" + ("0" + (ts.getMonth() + 1)).slice(-2) + "-" + ("0" + ts.getDate()).slice(-2)
                                returninfo = JSON.stringify({
                                    ID: result[0].id,
                                    CID: result[0].cid,
                                    Instructor: result[0].instructor,
                                    Date: testdata
                                })
                                timeout = 1;
                                clearTimeout(timeout)
                            }
                            return resolve(returninfo);
                        });
                    } else {
                        timeout = 1;
                        clearTimeout(timeout)
                        return resolve(returnInfo);
                    }
                    break;
                default:
                    if (!itemdata) {
                        itemdata = {}
                    }
                    returnInfo = JSON.stringify(itemdata);
                    timeout = 1
                    clearTimeout(timeout)
                    return resolve(returnInfo);
            }
        } else {
            return resolve(returnInfo);
        }

        setTimeout(() => {
            if (timeout == 0) {
                return resolve(returnInfo);
            }
        }, 500)
    });
};

function DroppedItem(itemArray) {
    itemArray = JSON.parse(itemArray)
    var shopItems = [];

    shopItems[0] = {
        item_id: itemArray[0].itemid,
        id: 0,
        name: "shop",
        information: "{}",
        slot: 1,
        amount: itemArray[0].amount
    };

    return JSON.stringify(shopItems);
};

/*

    Events

*/

onNet("onResourceStart", (resource) => {
    if (resource == GetCurrentResourceName()) {
        setTimeout(() => {
            emit("caue-inventory:luaItemList", itemList)
        }, 5000);
    }
})

RegisterServerEvent("SpawnEventsServer")
onNet("SpawnEventsServer", async () => {
    let src = source;

    emitNet("requested-dropped-items", src, JSON.stringify(Object.assign({}, DroppedInventories)));
});

RegisterServerEvent("server-request-update")
onNet("server-request-update", async (player) => {
    let src = source
    let playerinvname = 'ply-' + player
    let string = `SELECT count(item_id) as amount, id, name, item_id, information, slot, dropped, creationDate FROM inventory where name= '${playerinvname}' group by slot`;
    exports.ghmattimysql.execute(string, {}, function (inventory) {
        emitNet("inventory-update-player", src, [inventory, 0, playerinvname]);
    });
});

RegisterServerEvent("server-request-update-src")
onNet("server-request-update-src", async (player, src) => {
    let playerinvname = 'ply-' + player
    let string = `SELECT count(item_id) as amount, id, name, item_id, information, slot, dropped, creationDate FROM inventory where name= '${playerinvname}' group by slot`; // slot
    exports.ghmattimysql.execute(string, {}, function (inventory) {
        emitNet("inventory-update-player", src, [inventory, 0, playerinvname]);
    });
});

RegisterServerEvent("server-inventory-open")
onNet("server-inventory-open", async (coords, player, secondInventory, targetName, itemToDropArray, sauce, pWeight, pSlots) => {
    let src = source

    if (!src) {
        src = sauce
    }

    let playerinvname = 'ply-' + player

    if (InUseInventories[targetName] || InUseInventories[playerinvname]) {
        if (InUseInventories[playerinvname]) {
            if ((InUseInventories[playerinvname] != player)) {
                return
            } else {

            }
        }
        if (InUseInventories[targetName]) {
            if (InUseInventories[targetName] == player) {

            } else {
                secondInventory = "69"
            }
        }
    }

    exports.ghmattimysql.execute(`SELECT count(item_id) as amount, id, name, item_id, information, slot, dropped, creationDate FROM inventory where name= '${playerinvname}' group by slot`, {}, async function (inventory) {
        var invArray = inventory;
        var i;
        var arrayCount = 0;

        InUseInventories[playerinvname] = player;

        //emit("server-request-update-src", player, src)

        if (secondInventory == "1") {
            var targetinvname = targetName

            exports.ghmattimysql.execute(`SELECT count(item_id) as amount, id, name, item_id, information, slot, dropped, creationDate FROM inventory WHERE name = '${targetinvname}' group by slot`, {}, function (inventory2) {
                emitNet("inventory-open-target", src, [invArray, arrayCount, playerinvname, inventory2, 0, targetinvname, 500, true, pWeight, pSlots]);

                InUseInventories[targetinvname] = player
            });
        } else if (secondInventory == "3") {
            let Key = "" + DataEntries + "";
            let NewDroppedName = 'Drop-' + Key;

            DataEntries = DataEntries + 1
            var invArrayTarget = [];
            DroppedInventories[NewDroppedName] = {
                position: {
                    x: coords[0],
                    y: coords[1],
                    z: coords[2]
                },
                name: NewDroppedName,
                used: false,
                lastUpdated: Date.now()
            }


            InUseInventories[NewDroppedName] = player;

            invArrayTarget = JSON.stringify(invArrayTarget)
            emitNet("inventory-open-target", src, [invArray, arrayCount, playerinvname, invArrayTarget, 0, NewDroppedName, 500, false]);
        } else if (secondInventory == "13") {
            let Key = "" + DataEntries + "";
            let NewDroppedName = 'Drop-' + Key;
            DataEntries = DataEntries + 1
            for (let Key in itemToDropArray) {
                for (let i = 0; i < itemToDropArray[Key].length; i++) {
                    let objectToDrop = itemToDropArray[Key][i];
                    db(`UPDATE inventory SET slot='${i+1}', name='${NewDroppedName}', dropped='1' WHERE name='${Key}' and slot='${objectToDrop.faultySlot}' and item_id='${objectToDrop.faultyItem}' `);
                }
            }

            DroppedInventories[NewDroppedName] = {
                position: {
                    x: coords[0],
                    y: coords[1],
                    z: coords[2]
                },
                name: NewDroppedName,
                used: false,
                lastUpdated: Date.now()
            }
            emitNet("Inventory-Dropped-Addition", -1, DroppedInventories[NewDroppedName])
        } else if (secondInventory == "42069") {
            let Key = "" + DataEntries + "";
            let NewDroppedName = 'Drop-' + Key;

            DataEntries = DataEntries + 1

            DroppedInventories[NewDroppedName] = {
                position: {
                    x: coords[0],
                    y: coords[1],
                    z: coords[2]
                },
                name: NewDroppedName,
                used: true,
                lastUpdated: Date.now()
            }

            emitNet("Inventory-Dropped-Addition", -1, DroppedInventories[NewDroppedName])

            let creationDate = Date.now()
            let information = "{}";

            if (itemToDropArray.generateInformation || itemToDropArray.data) {
                information = await GenerateInformation(player, itemToDropArray.itemid, itemToDropArray.data);
            }

            db(`INSERT INTO inventory (item_id, name, information, slot, dropped, creationDate) VALUES ('${itemToDropArray.itemid}','${NewDroppedName}','${information}','${itemToDropArray.slot}', '1', '${creationDate}' );`);
        } else if (shopList[secondInventory]) {
            var targetinvname = targetName;
            var shopArray = shopList[secondInventory];
            var shopAmount = shopArray.length;

            shopArray.forEach(function(item, index) {
                item["id"] = 0;
                item["name"] = targetinvname;
                item["information"] = "{}";
                item["slot"] = index + 1;
            });

            emitNet("inventory-open-target", src, [invArray, arrayCount, playerinvname, JSON.stringify(shopArray), shopAmount, targetinvname, 500, false, false, false, secondInventory]);
        } else if (secondInventory == "7") {
            var targetinvname = targetName;
            var shopArray = DroppedItem(itemToDropArray);

            itemToDropArray = JSON.parse(itemToDropArray)
            var shopAmount = itemToDropArray.length;

            emitNet("inventory-open-target", src, [invArray, arrayCount, playerinvname, shopArray, shopAmount, targetinvname, 500, false]);
        } else {
            emitNet("inventory-update-player", src, [invArray, arrayCount, playerinvname]);
        }
    });
});

RegisterServerEvent("server-inventory-refresh")
onNet("server-inventory-refresh", async (player, sauce) => {
    let src = source
    if (!src) {
        src = sauce
    }

    let string = `SELECT count(item_id) as amount, id, name, item_id, information, slot, dropped, creationDate FROM inventory where name= 'ply-${player}' group by slot`;
    exports.ghmattimysql.execute(string, {}, function (inventory) {
        if (!inventory) {} else {
            var invArray = inventory;
            var arrayCount = 0;
            var playerinvname = player
            emitNet("inventory-update-player", src, [invArray, arrayCount, playerinvname]);
            emitNet('current-items', src, invArray)
        }
    })
});

RegisterServerEvent("server-inventory-close")
onNet("server-inventory-close", async (player, targetInventoryName) => {
    let src = source

    //line 647
    if (targetInventoryName.startsWith("Trunk")) {
        emitNet("toggle-animation", src, false);
    }

    InUseInventories = InUseInventories.filter(item => item != player);

    if (targetInventoryName.indexOf("Drop") > -1 && DroppedInventories[targetInventoryName]) {
        if (DroppedInventories[targetInventoryName].used === false) {
            delete DroppedInventories[targetInventoryName];
        } else {
            let string = `SELECT count(item_id) as amount, item_id, name, information, slot, dropped FROM inventory WHERE name='${targetInventoryName}' group by item_id `;
            exports.ghmattimysql.execute(string, {}, function (result) {
                if (result.length == 0 && DroppedInventories[targetInventoryName]) {
                    delete DroppedInventories[targetInventoryName];
                    emitNet("Inventory-Dropped-Remove", -1, [targetInventoryName])
                }
            });
        }
    }

    emit("server-request-update-src", player, source)
});

RegisterServerEvent("server-inventory-move")
onNet("server-inventory-move", async (player, data, coords) => {
    let src = source

    let targetslot = data[0]
    let startslot = data[1]
    let targetName = data[2].replace(/"/g, "");
    let startname = data[3].replace(/"/g, "");
    let purchase = data[4]
    let itemCosts = data[5]
    let itemidsent = data[6]
    let amount = data[7]
    let crafting = data[8]
    let isWeapon = data[9]
    let PlayerStore = data[10]
    let shopId = data[11]
    let creationDate = Date.now()

    if ((targetName.indexOf("Drop") > -1 || targetName.indexOf("hidden") > -1) && DroppedInventories[targetName]) {
        if (DroppedInventories[targetName].used === false) {
            DroppedInventories[targetName] = {
                position: {
                    x: coords[0],
                    y: coords[1],
                    z: coords[2]
                },
                name: targetName,
                used: true,
                lastUpdated: Date.now()
            }
            emitNet("Inventory-Dropped-Addition", -1, DroppedInventories[targetName])
        }
    }

    let info = "{}"

    if (purchase) {
        info = await GenerateInformation(player, itemidsent)

        exports["caue-financials"].updateCash(src, "-", itemCosts)

        let baseprice = itemList[itemidsent].price
        exports["caue-financials"].addTaxFromValue("Goods", baseprice)

        if (PlayerStore) {
            exports.ghmattimysql.execute(`UPDATE inventory SET slot='${targetslot}', name='${targetName}', dropped='0' WHERE slot='${startslot}' and name='${startname}'`);
        } else if (crafting) {
            for (let i = 0; i < parseInt(amount); i++) {
                info - await GenerateInformation(player, itemidsent)
                exports.ghmattimysql.execute(`INSERT INTO inventory (item_id, name, information, slot, creationDate) VALUES ('${itemidsent}','${targetName}','${info}','${targetslot}','${creationDate}' );`);
            }
        } else {
            for (let i = 0; i < parseInt(amount); i++) {
                info - await GenerateInformation(player, itemidsent)
                db(`INSERT INTO inventory (item_id, name, information, slot, creationDate) VALUES ('${itemidsent}','${targetName}','${info}','${targetslot}','${creationDate}' );`);
            }
        }
    } else if (crafting == true) {
        for (let i = 0; i < parseInt(amount); i++) {
            info - await GenerateInformation(player, itemidsent)
            exports.ghmattimysql.execute(`INSERT INTO inventory (item_id, name, information, slot, creationDate) VALUES ('${itemidsent}','${targetName}','${info}','${targetslot}','${creationDate}' );`);
        }
    } else {
        let dropped = 0;
        if (targetName.indexOf("Drop") > -1 || targetName.indexOf("hidden") > -1) {
            dropped = 1;
        };

        exports.ghmattimysql.execute(`UPDATE inventory SET slot='${targetslot}', name='${targetName}', dropped='${dropped}' WHERE slot='${startslot}' and name='${startname}'`);
    }
});

RegisterServerEvent("server-inventory-stack")
onNet("server-inventory-stack", async (player, data, coords) => {
    let src = source

    let targetslot = data[0]
    let moveAmount = data[1]
    let targetName = data[2].replace(/"/g, "");
    let originSlot = data[3]
    let originInventory = data[4].replace(/"/g, "");
    let purchase = data[5]
    let itemCosts = data[6]
    let itemidsent = data[7]
    let amount = data[8]
    let crafting = data[9]
    let isWeapon = data[10]
    let PlayerStore = data[11]
    let amountRemaining = data[12]
    let shopId = data[13]
    let creationDate = Date.now()

    if ((targetName.indexOf("Drop") > -1 || targetName.indexOf("hidden") > -1) && DroppedInventories[targetName]) {
        if (DroppedInventories[targetName].used === false) {
            DroppedInventories[targetName] = {
                position: {
                    x: coords[0],
                    y: coords[1],
                    z: coords[2]
                },
                name: targetName,
                used: true,
                lastUpdated: Date.now()
            }
            emitNet("Inventory-Dropped-Addition", -1, DroppedInventories[targetName])
        }
    }

    let info = "{}"

    if (purchase) {
        info = await GenerateInformation(player, itemidsent)

        let cid = parseInt(targetName.replace("ply-", ""))
        let accountId = shopAccounts[shopId]
        let baseprice = itemList[itemidsent].price
        let itemname = itemList[itemidsent].displayname
        let comment = "Brought " + amount + " " + itemname

        exports["caue-financials"].updateCash(src, "-", itemCosts)
        exports["caue-financials"].updateBalance(accountId, "+", itemCosts)
        exports["caue-financials"].transaction(accountId, accountId, baseprice, comment, cid, 7)
        exports["caue-financials"].addTaxFromValue("Goods", baseprice)

        if (PlayerStore) {
            payStore(startname, itemCosts, itemidsent)

            exports.ghmattimysql.execute(`UPDATE inventory SET slot='${targetslot}', name='${targetname}', dropped = '0' WHERE slot='${startslot}' AND name='${startname}'`);
        } else {
            for (let i = 0; i < parseInt(amount); i++) {
                info = await GenerateInformation(player, itemidsent);
                exports.ghmattimysql.execute(`INSERT INTO inventory (item_id, name, information, slot, creationDate) VALUES ('${itemidsent}','${targetName}','${info}','${targetslot}','${creationDate}' );`);
            }
        }
    } else if (crafting) {
        for (let i = 0; i < parseInt(amount); i++) {
            info = await GenerateInformation(player, itemidsent)
            exports.ghmattimysql.execute(`INSERT INTO inventory (item_id, name, information, slot, creationDate) VALUES ('${itemidsent}','${targetName}','${info}','${targetslot}','${creationDate}' );`);
        }
    } else {
        if (amountRemaining > 0) {
            moveAmount = moveAmount + 1
        };

        let string = `SELECT id, item_id, creationDate FROM inventory WHERE slot='${originSlot}' and name='${originInventory}' LIMIT ${moveAmount}`;
        exports.ghmattimysql.execute(string, {}, function (result) {
            let toupdate = 0;
            var itemids = "0";
            result.forEach(function(item, index) {
                if ((amountRemaining > 0) && (index == (result.length - 1))) {
                    toupdate = item.creationDate
                } else {
                    itemids = itemids + "," + item.id
                }
            });

            let dropped = 0;
            if (targetName.indexOf("Drop") > -1 || targetName.indexOf("hidden") > -1) {
                dropped = 1;
            };

            exports.ghmattimysql.execute(`UPDATE inventory SET slot='${targetslot}', name='${targetName}', dropped='${dropped}' WHERE id IN (${itemids})`, {}, function (result2) {
                if (toupdate != 0) {
                    emitNet("inventory:qualityUpdate", src, originSlot, originInventory, toupdate);
                };
            });
        });
    }
});

RegisterServerEvent("server-inventory-swap")
onNet("server-inventory-swap", (player, data, coords) => {
    let targetslot = data[0]
    let targetname = data[1].replace(/"/g, "");
    let startslot = data[2]
    let startname = data[3].replace(/"/g, "");

    exports.ghmattimysql.execute(`SELECT id FROM inventory WHERE slot='${targetslot}' AND name='${targetname}'`, {}, function (startid) {
        var itemids = "0"
        for (let i = 0; i < startid.length; i++) {
            itemids = itemids + "," + startid[i].id

        }

        let string = false;
        if (targetname.indexOf("Drop") > -1 || targetname.indexOf("hidden") > -1) {
            string = `UPDATE inventory SET slot='${targetslot}', name ='${targetname}', dropped='1' WHERE slot='${startslot}' AND name='${startname}'`;
        } else {
            string = `UPDATE inventory SET slot='${targetslot}', name ='${targetname}', dropped='0' WHERE slot='${startslot}' AND name='${startname}'`;
        }

        exports.ghmattimysql.execute(string, {}, function (inventory) {
            if (startname.indexOf("Drop") > -1 || startname.indexOf("hidden") > -1) {
                exports.ghmattimysql.execute(`UPDATE inventory SET slot='${startslot}', name='${startname}', dropped='1' WHERE id IN (${itemids})`);
            } else {
                exports.ghmattimysql.execute(`UPDATE inventory SET slot='${startslot}', name='${startname}', dropped='0' WHERE id IN (${itemids})`);
            }
        });
    });
});

RegisterServerEvent("server-update-item")
onNet("server-update-item", async (player, itemidsent, slot, data) => {
    let src = source
    let playerinvname = 'ply-' + player
    let string = `UPDATE inventory SET information='${data}' WHERE item_id='${itemidsent}' and name='${playerinvname}' and slot='${slot}'`

    exports.ghmattimysql.execute(string, {}, function () {
        emit("server-request-update-src", player, src)
    });
});

RegisterServerEvent("server-update-item-id")
onNet("server-update-item-id", async (player, id, data) => {
    let src = source
    let playerinvname = 'ply-' + player
    let newdata = JSON.stringify(data)

    let string = `UPDATE inventory SET information='${newdata}' WHERE id='${id}' and name='${playerinvname}'`
    exports.ghmattimysql.execute(string, {}, function () {
        emit("server-request-update-src", player, src)
    });
});

RegisterServerEvent("server-inventory-give")
onNet("server-inventory-give", async (player, itemid, slot, amount, generateInformation, itemdata, openedInv) => {
    let src = source
    let playerinvname = 'ply-' + player
    let information = "{}"
    let creationDate = Date.now()

    if (generateInformation || itemdata) {
        information = await GenerateInformation(player, itemid, itemdata)
    }

    let values = `('${playerinvname}','${itemid}','${information}','${slot}','${creationDate}')`
    if (amount > 1) {
        for (let i = 2; i <= amount; i++) {
            values = values + `,('${playerinvname}','${itemid}','${information}','${slot}','${creationDate}')`

        }
    }

    let query = `INSERT INTO inventory (name,item_id,information,slot,creationDate) VALUES ${values};`
    exports.ghmattimysql.execute(query, {}, function () {
        emit("server-request-update-src", player, src)
    });

});

RegisterServerEvent("server-remove-item")
onNet("server-remove-item", async (player, itemidsent, amount, openedInv) => {
    var src = exports["caue-base"].getSidWithCid(player)
    var playerinvname = 'ply-' + player

    exports.ghmattimysql.execute(`DELETE FROM inventory WHERE name='${playerinvname}' and item_id='${itemidsent}' LIMIT ${amount}`, {}, function () {
        if (src != 0) {
            emit("server-request-update-src", player, src)
        }
    });
});

RegisterServerEvent("server-inventory-remove")
onNet("server-inventory-remove-slot", async (player, itemidsent, amount, slot) => {
    var src = exports["caue-base"].getSidWithCid(player)
    var playerinvname = 'ply-' + player

    exports.ghmattimysql.execute(`DELETE FROM inventory WHERE name='${playerinvname}' and item_id='${itemidsent}' and slot='${slot}' LIMIT ${amount}`, {}, function () {
        if (src != 0) {
            emit("server-request-update-src", player, src)
        }
    });
});

RegisterServerEvent("server-remove-item-kv")
onNet("server-remove-item-kv", async (player, itemidsent, amount, metaKey, metaValue) => {
    var src = exports["caue-base"].getSidWithCid(player)
    var playerinvname = 'ply-' + player

    exports.ghmattimysql.execute(`SELECT id, information FROM inventory WHERE item_id='${itemidsent}' AND name='${playerinvname}'`, {}, function (startid) {
        var itemids = "0"

        for (let i = 0; i < startid.length; i++) {
            let meta = JSON.parse(startid[i].information)

            if (meta[metaKey] == metaValue) {
                itemids = itemids + "," + startid[i].id
            }
        }

        exports.ghmattimysql.execute(`DELETE FROM inventory WHERE id IN (${itemids}) LIMIT ${amount}`, {}, function () {
            if (src != 0) {
                emit("server-request-update-src", player, src)
            }
        });
    });
});

RegisterServerEvent("inventory:degItem")
onNet("inventory:degItem", async (pItemId, pPercent, pItemClass, pCid) => {
    if (itemList[pItemClass.toString()] == null || itemList[pItemClass.toString()].decayrate <= 0.0) {
        return
    }

    let percent = Math.round(((TimeAllowed * itemList[pItemClass.toString()].decayrate) / 100) * pPercent)

    exports.ghmattimysql.execute(`UPDATE inventory set creationDate = creationDate - ${percent} WHERE id = ${pItemId}`);
});

RegisterServerEvent("caue-inventory:clear")
onNet("caue-inventory:clear", async (_src, _name) => {
    let src = source
    if (_src != undefined) {
        src = _src
    }

    let cid = 0
    let name = ""
    if (!_name) {
        cid = exports["caue-base"].getChar(src, "id")
        if (!cid) {
            return
        }

        name = "ply-" + cid
    } else {
        name = _name
    }

    exports.ghmattimysql.execute(`DELETE FROM inventory WHERE name='${name}'`, {}, function () {
        if (cid > 0) {
            emit("server-request-update-src", cid, src)

            exports.ghmattimysql.scalar(`SELECT cash FROM characters WHERE id = '${cid}'`, {}, function(cash){
                if (cash && cash > 0) {
                    exports["caue-financials"].updateCash(src, "-", cash)
                }
            })
        }
    });
});

/*

    Jail

*/

RegisterServerEvent('server-jail-item')
onNet("server-jail-item", async (player, isSentToJail) => {
    let currInventoryName = `${player}`
    let newInventoryName = `${player}`

    if (isSentToJail) {
        currInventoryName = `jail-${player}`
        newInventoryName = `${player}`
    } else {
        currInventoryName = `${player}`
        newInventoryName = `jail-${player}`
    }

    db(`UPDATE inventory SET name='${currInventoryName}', WHERE name='${newInventoryName}' and dropped=0`);
});

/*
    Stores and Traphouses
*/

function mathrandom(min, max) {
    return Math.floor(Math.random() * (max + 1 - min)) + min;
}

function payStore(storeName, amount, itemid) {

    if (storeName.indexOf("Traphouse") > -1) {
        let id = storeName.split('|')

        id = id[0].split('-')[1]

        emit('traps:pay', id, amount)
    } else {

        let cid = storeName.split('|')
        let name = cid[1]
        if (itemList[itemid].illegal && mathrandom(1, 100) > 80) {
            //      emitNet('IllegalSale',"Store Owner", name)
        }
        cid = cid[0].split('-')[1]
        emit('server:PayStoreOwner', cid, amount)
    }
}

RegisterServerEvent('stores:pay:cycle')
onNet('store:pay:cycle', async (storeList) => {

    storeList = JSON.parse(storeList)
    for (let key in storeList) {

        if (storeList[key].house_model == 4) {
            let trap = storeList[key]["trap"]
            let id = storeList[key]["dbid"]
            let name = storeList[key]["stash"]
            let storeName = storeList[key]["name"]
            let reputation = storeList[key]["reputation"]
            let luckyslot = 1
            let luckroll = mathrandom(1, 100)
            let amount = 1
            let inventoryType = 'house_information'

            if (trap) {
                inventoryType = 'trap_houses'
            }

            let itemid = 0
            let rolled = reputation + luckroll
            if (rolled > 96) {

                if (rolled > 120) {
                    amount = 2
                }
                if (rolled > 150) {
                    amount = 3
                }
                if (rolled > 180) {
                    amount = 4
                }
                if (rolled > 149) {
                    amount = 7
                }

                if (amount > 0) {
                    let slot = mathrandom(1, 2)
                    let string = `SELECT item_id FROM inventory WHERE name = '${name}' and slot = '${slot}'`;
                    exports.ghmattimysql.execute(string, {}, function (inventory) {
                        if (inventory.length > 0) {
                            emitNet("ai:storewalkout", -1, key)
                            if (amount > inventory.length) {
                                amount = inventory.length
                            }

                            let string = `DELETE FROM inventory WHERE name='${name}' and slot = '${slot}' LIMIT ${amount}`;

                            exports.ghmattimysql.execute(string, {}, function () {});

                            let itemid = inventory[0].item_id
                            let sellValue = itemList[itemid].price * amount

                            if (reputation < 10) {
                                sellValue = sellValue * 0.5
                            } else if (reputation < 20) {
                                sellValue = sellValue * 0.55
                            } else if (reputation < 30) {
                                sellValue = sellValue * 0.6
                            } else if (reputation < 50) {
                                sellValue = sellValue * 0.65
                            } else if (reputation < 70) {
                                sellValue = sellValue * 0.75
                            } else if (reputation < 80) {
                                sellValue = sellValue * 0.8
                            } else if (reputation < 90) {
                                sellValue = sellValue * 0.9

                            }

                            sellValue = Math.ceil(sellValue)

                            payStore(name, sellValue, itemid)
                            if (rolled == 100 && itemList[itemid].illegal) {
                                reputation = reputation + 1
                                if (reputation < 100) {
                                    let string = `UPDATE ${inventoryType} SET reputation='${reputation}' WHERE id='${id}'`
                                    exports.ghmattimysql.execute(string, {}, function () {});
                                }
                            }
                        } else {
                            if (reputation > 0 && mathrandom(1, 100) > 98) {
                                reputation = reputation - 1
                                let string = `UPDATE ${inventoryType} SET reputation='${reputation}' WHERE id='${id}'`
                                exports.ghmattimysql.execute(string, {}, function () {});
                            }
                        }
                        //
                    });
                }
            }
        }
    }
});