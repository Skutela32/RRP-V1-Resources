local RegisterUsable = nil

if Config.Framework == "ESX" then
    ESX = nil
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    RegisterUsable = ESX.RegisterUsableItem
elseif Config.Framework == "qbcore" then
    QBCore = exports['qb-core']:GetCoreObject()
    RegisterUsable = QBCore.Functions.CreateUseableItem
end

for k, v in pairs(Config.Consumables) do
    if k == "lsd" or k == "ecstasy" then
        for i = 1, 5 do
            RegisterUsable(k .. i, function(source)
                Logs(v.Log)
                if v.Remove then
                    if GetItem(v.RemoveItem .. i, v.RemoveItemCount, source) then
                        RemoveItem(v.RemoveItem .. i, v.RemoveItemCount, source)
                        TriggerClientEvent('drc_drugs:consumables', source, v.ProgressBar, v.animation, v.duration,
                            v.effect)
                    end
                else
                    TriggerClientEvent('drc_drugs:consumables', source, v.ProgressBar, v.animation, v.duration, v.effect)
                end
            end)
        end
    else
        RegisterUsable(k, function(source)
            Logs(v.Log)
            if v.Remove then
                if GetItem(v.RemoveItem, v.RemoveItemCount, source) then
                    RemoveItem(v.RemoveItem, v.RemoveItemCount, source)
                    TriggerClientEvent('drc_drugs:consumables', source, v.ProgressBar, v.animation, v.duration, v.effect)
                end
            else
                TriggerClientEvent('drc_drugs:consumables', source, v.ProgressBar, v.animation, v.duration, v.effect)
            end
        end)
    end
end

RegisterUsable('weed_wrap', function(source)
    TriggerClientEvent('drc_drugs:consumables:menu', source, "weed_wrap")
end)

RegisterUsable('syringe', function(source)
    TriggerClientEvent('drc_drugs:consumables:menu', source, "syringe")
end)

RegisterUsable('weed_papers', function(source)
    TriggerClientEvent('drc_drugs:consumables:menu', source, "weed_papers")
end)

RegisterUsable('xanaxpack', function(source)
    TriggerClientEvent('drc_drugs:consumables:progress', source, "xanax_pack")
end)

RegisterUsable('xanaxplate', function(source)
    TriggerClientEvent('drc_drugs:consumables:progress', source, "xanax_plate")
end)

RegisterUsable('coke_figure', function(source)
    TriggerClientEvent('drc_drugs:coke:menus', source, "FullFigure")
end)
RegisterUsable('coke_figureempty', function(source)
    TriggerClientEvent('drc_drugs:coke:menus', source, "EmptyFigure")
end)

RegisterUsable('coke_figurebroken', function(source)
    TriggerClientEvent('drc_drugs:coke:menus', source, "BrokenFigure")
end)

lib.callback.register('drc_drugs:consumables:getitem', function(source, type)
    if type == "weed_wrap" then
        if GetItem("weed_package", 1, source) and GetItem("weed_wrap", 1, source) then
            return true
        else
            return false
        end
    elseif type == "weed_papers" then
        if GetItem("weed_package", 1, source) and GetItem("weed_papers", 1, source) then
            return true
        else
            return false
        end
    elseif type == "heroin" then
        if GetItem("syringe", 1, source) and GetItem("heroin", 1, source) then
            return true
        else
            return false
        end
    elseif type == "meth" then
        if GetItem("syringe", 1, source) and GetItem("meth_bag", 1, source) then
            return true
        else
            return false
        end
    end
end)

RegisterServerEvent("drc_drugs:consumables:giveitems")
AddEventHandler("drc_drugs:consumables:giveitems", function(type)
    if type == "weed_wrap" then
        if GetItem("weed_package", 1, source) and GetItem("weed_wrap", 1, source) then
            RemoveItem("weed_package", 1, source)
            RemoveItem("weed_wrap", 1, source)
            AddItem("weed_blunt", 1, source)
        end
    elseif type == "weed_papers" then
        if GetItem("weed_package", 1, source) and GetItem("weed_papers", 1, source) then
            RemoveItem("weed_package", 1, source)
            RemoveItem("weed_papers", 1, source)
            AddItem("weed_joint", 1, source)
        end
    elseif type == "xanax_pack" then
        if GetItem("xanaxpack", 1, source) then
            RemoveItem("xanaxpack", 1, source)
            AddItem("xanaxplate", 2, source)
        end
    elseif type == "xanax_plate" then
        if GetItem("xanaxplate", 1, source) then
            RemoveItem("xanaxplate", 1, source)
            AddItem("xanaxpill", 10, source)
        end
    elseif type == "meth" then
        if GetItem("syringe", 1, source) and GetItem("meth_bag", 1, source) then
            RemoveItem("meth_bag", 1, source)
            RemoveItem("syringe", 1, source)
            AddItem("meth_syringe", 1, source)
        end
    elseif type == "heroin" then
        if GetItem("syringe", 1, source) and GetItem("heroin", 1, source) then
            RemoveItem("heroin", 1, source)
            RemoveItem("syringe", 1, source)
            AddItem("heroin_syringe", 1, source)
        end
    end
end)
