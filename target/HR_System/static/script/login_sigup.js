// 点击sigup触发翻转样式
$("#sigup").click(function () {
    $(".mainbox").toggleClass("middle-flip");
});

// 点击login触发翻转样式
$("#login").click(function () {
    $(".mainbox").toggleClass("middle-flip");
});
// 注册页面的js非空处理
var flag=true;  //标记位
function FocusItem(obj) {
    if($(obj).attr('name') == 'veryCode') {
        $(obj).next().next().html('').removeClass('error');
    }else {
        $(obj).next('span').html('').removeClass('error');
    }
}
function CheckItem(obj){
    var msgBox = $(obj).next('span');

    switch($(obj).attr('name')) {
        case "username":
            if(obj.value==""){
                msgBox.html('用户名不能为空！');
                msgBox.addClass('error');
                flag=false;
            }else{
                flag=true;
            }
            break;
        case "password":
            if(obj.value==""){
                msgBox.html('密码不能为空！');
                msgBox.addClass('error');
                flag=false;}
            break;

        case"email":
            if(obj.value==""){
                msgBox.html('邮箱不能为空！');
                msgBox.addClass('error');
                flag=false;
            }else{
                flag=true;
            }
            break;
    }
}
function checkForm(frm){
    var els =frm.getElementsByTagName('input');
    for(var i=0; i<els.length;i++){
        if(els[i] !=null){
            if(els[i].getAttribute("onblur")){
                CheckItem(els[i]);
            }
        }
    }
    return flag;
}

