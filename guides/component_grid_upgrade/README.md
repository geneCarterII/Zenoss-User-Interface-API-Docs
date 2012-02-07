# Differences in ZenPacks between ExtJs3 and ExtJs4
______________________________________________

With the release of Zenoss Core 4.2 the front end was upgraded to the latest version of the ExtJs library. This means that all the javascript written by zenpack authors will have to be upgraded as well. We have modified the example javascript inside the ZenPack template to reflect the necessary changes to serve as an example for zenpack authors..
The differences between the two versions of the framework are fairly numerous and fall outside the scope of this document. For a brief overview please visit the following link:
http://docs.sencha.com/ext-js/4-0/#!/guide/upgrade

## I. Custom Component Grid Panels
______________

In zenoss version 4.2 we have written in overrides that allow the custom component grids to work with the old ExtJs3 style of declaration. However in future versions we will likely remove the compatibility and the old style declarations of classes should be considered deprecated.  This section outlines how to modify your component grid definition to work with extjs 4.

Previously this was how a custom component panel was declared:

    /*
     * Custom component grid panel. This controls the grid that gets displayed for
     * components of the type set in "componentType".
     */
    ZC.ExampleComponentGridPanel = Ext.extend(ZC.ComponentGridPanel, {
        subComponentGridPanel: false,

        constructor: function(config) {
            config = Ext.applyIf(config||{}, {
                autoExpandColumn: 'name',
                componentType: 'ExampleComponent',
                sortInfo: {
                    field: 'name',
                    direction: 'ASC'
                },
                fields: [
                    {name: 'uid'},
                    {name: 'name'},
                    {name: 'severity'},
                    {name: 'attributeOne'},
                    {name: 'attributeTwo'},
                    {name: 'monitor'},
                    {name: 'monitored'}
                ],
                columns: [{
                    id: 'severity',
                    dataIndex: 'severity',
                    header: _t('Events'),
                    renderer: Zenoss.render.severity,
                    sortable: true,
                    width: 50
                },{
                    id: 'name',
                    dataIndex: 'name',
                    header: _t('Name')
                },{
                    id: 'attributeOne',
                    dataIndex: 'attributeOne',
                    header: _t('Attribute #1'),
                    sortable: true,
                    width: 70
                },{
                    id: 'attributeTwo',
                    dataIndex: 'attributeTwo',
                    header: _t('Attribute #2'),
                    sortable: true,
                    width: 70
                },{
                    id: 'monitored',
                    dataIndex: 'monitored',
                    header: _t('Monitored'),
                    renderer: Zenoss.render.checkbox,
                    sortable: true,
                    width: 65
                }]
            });
            ZC.ExampleComponentGridPanel.superclass.constructor.call(this, config);
        }
    });

    Ext.reg('ExampleComponentGridPanel', ZC.ExampleComponentGridPanel);

Where as the new form for declaring a class under ExtJS4 is as follows:

    /*
     * Custom component grid panel. This controls the grid that gets displayed for
     * components of the type set in "componenType".
     */
    Ext.define('Zenoss.component.ExampleComponentGridPanel',{
        extend: 'Zenoss.component.ComponentGridPanel',
        subComponentGridPanel: false,

        constructor: function(config) {
            config = Ext.applyIf(config||{}, {
                componentType: 'ExampleComponent',
                alias:['widget.ExampleComponentGridPanel'],
                sortInfo: {
                    field: 'name',
                    direction: 'ASC'
                },
                fields: [
                    {name: 'uid'},
                    {name: 'name'},
                    {name: 'severity'},
                    {name: 'attributeOne'},
                    {name: 'attributeTwo'},
                    {name: 'monitor'},
                    {name: 'monitored'}
                ],
                columns: [{
                    id: 'severity',
                    dataIndex: 'severity',
                    header: _t('Events'),
                    renderer: Zenoss.render.severity,
                    sortable: true,
                    width: 50
                },{
                    id: 'name',
                    flex: 1,
                    dataIndex: 'name',
                    header: _t('Name')
                },{
                    id: 'attributeOne',
                    dataIndex: 'attributeOne',
                    header: _t('Attribute #1'),
                    sortable: true,
                    width: 70
                },{
                    id: 'attributeTwo',
                    dataIndex: 'attributeTwo',
                    header: _t('Attribute #2'),
                    sortable: true,
                    width: 70
                },{
                    id: 'monitored',
                    dataIndex: 'monitored',
                    header: _t('Monitored'),
                    renderer: Zenoss.render.checkbox,
                    sortable: true,
                    width: 65
                }]
            });
            this.callParent([config]);
        }
    });

The major differences are that we use “Ext.define” instead of Ext.extend to declare our class. Also the name of the class is a case-sensitive string. This allows Ext to keep track of the class hierarchy and alleviates the developer from the responsibility of declaring a namespace. Something else that is important is that instead of doing
Ext.reg('ExampleComponentGridPanel', ZC.ExampleComponentGridPanel);
we provide the alias attribute of the class:
    alias:['widget.ExampleComponentGridPanel'],
This will associate the component you make with the xtype. Please note that the name of the component must be the “componentType”  plus “Panel”. For example if you had a component type of “HardDisk” the panel must be called “HardDiskPanel”.
The column and fields declarations remain unchanged.
