<html>
<head>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/extjs/6.0.0/classic/theme-classic/resources/theme-classic-all.css" rel="stylesheet" />
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/extjs/6.0.0/ext-all.js"></script>
    <script>
        //creating of data Model
        Ext.define('StudentDataModel',{
            extend: 'Ext.data.Model',
            fields: [{
                name: 'name',
                mapping: 'name'
            },{
                name: 'age',
                mapping: 'age'
            },{
                name: 'marks',
                mapping: 'marks'
            }]
        });

        Ext.onReady(function () {
            //Store data
            var myData =[
                {name: 'liXueFeng', age: '18', marks: 'pretty girl'},
                {name: 'Zhangxuefeng', age: '23', marks: 'cool boy'},
                {name: 'Liye', age: '34', marks: 'gril'},
                {name: 'ZhaoChengGong', age: '28', marks: 'boy'},
                {name: 'LiMing', age: '7', marks: 'student'}
            ];

            //creation of first grid store
            var gridStore = Ext.create('Ext.data.Store',{
                model: 'StudentDataModel',
                data: myData
            });

            //creation of frist grid
            Ext.create('Ext.grid.Panel',{
                id: 'gridId',
                store: gridStore,
                stripeRows: true,
                title: 'Student Grid',
                renderTo: 'gridDiv',
                width: 600,
                collapsible: true,
                enableColumnMove: true,
                enableColumnResize: true,
                columns:[{
                        header: 'Student Name',
                        dataIndex: 'name',
                        id: 'name',
                        flex: 1,
                        sortable: true,
                        hideable: true
                    },{
                        header: 'Age',
                        dataIndex: 'age',
                        flex: .5,
                        sortable: true,
                        hideable: false
                    },{
                        header: 'Marks',
                        dataIndex: 'marks',
                        flex: .5,
                        sortable: true,
                        renderer:function (value, metadata, record, rowIndex, colIndex, store) {
                            if (value > 75) {
                                return "Distinction";
                            } else {
                                return "Non Distinction";
                            }
                        }
                    }
                ],
            });
        });
    </script>
</head>
<body>
<h2>Hello World!</h2>
    <div id = "gridDiv"></div>
</body>
</html>
