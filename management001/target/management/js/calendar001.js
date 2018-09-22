$(function(){
    //初始化FullCalendar
    $('#calendar').select=function(start, end, jsEvent, view){
            //添加日程事件
            var win = $('#addCalendarWin');
            win.find('input[name="start"]').val(start.format('YYYY-MM-DD HH:mm'));
            win.find('input[name="end"]').val(end.format('YYYY-MM-DD HH:mm'));
            //win.rhui('window').show();
            win.modal('show');
        };
        /*
         修改日程事件
         当点击日历中的某一日程时，触发此事件
         data: 日程信息
         jsEvent: jascript对象
         view: 当前视图对象
         */
    $('#calendar').eventClick=function(data, jsEvent, view){
            //修改日程事件
            var win = $('#editCalendarWin');
            win.find('input[name="id"]').val(data.id);
            win.find('input[name="title"]').val(data.title);
            win.find('textarea[name="content"]').val(data.content);
            win.find('input[name="start"]').val(data.start.format('YYYY-MM-DD HH:mm'));
            win.find('input[name="end"]').val(data.end.format('YYYY-MM-DD HH:mm'));
            //win.rhui('window').show();
            win.modal('show');
        }
    });

    //初始化新建日程窗口
    $(function(){
        var win = $('#addCalendarWin');

        //初始化日期控件
        win.find('input[name="start"]').datetimepicker({format: 'Y-m-d H:i'});
        win.find('input[name="end"]').datetimepicker({format: 'Y-m-d H:i'});

        win.modal('window', {
            title: '新建日程',
            width: 400,
            height: 265,
            buttons: [{
                text: '确定',
                cls: 'rhui-btn-primary',
                click: function(toolbar, win){
                    alert('日程已新建');
                }
            },{
                text: '取消',
                click: function(toolbar, win){
                    win.hide();
                }
            }]
        });
    });

    //初始化修改日程窗口
    $(function(){
        var win = $('#editCalendarWin');

        //初始化日期控件
        win.find('input[name="start"]').datetimepicker({format: 'Y-m-d H:i'});
        win.find('input[name="end"]').datetimepicker({format: 'Y-m-d H:i'});

        win.modal('window', {
            title: '修改日程',
            width: 400,
            height: 265,
            buttons: [{
                text: '确定',
                cls: 'rhui-btn-primary',
                click: function(toolbar, win){
                    alert('日程已修改');
                }
            },{
                text: '删除',
                cls: 'rhui-btn-danger',
                click: function(toolbar, win){
                    alert('日程已删除');
                }
            },{
                text: '取消',
                click: function(toolbar, win){
                    win.hide();
                }
            }]
        });
    });