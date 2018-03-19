var express=require('express');
//引入url模块解析url字符串
var url = require('url');

//引入querystring模块处理query字符串
var querystring = require('querystring');
var db = require('./conn/db');
var app =express();

var send = require('./func/email');
//设置跨域访问
app.all('*', function(req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "X-Requested-With");
    res.header("Access-Control-Allow-Methods","PUT,POST,GET,DELETE,OPTIONS");
    res.header("X-Powered-By",' 3.2.1');
    res.header("Content-Type", "application/json;charset=utf-8");
    next();
});

var questions=[
    {
        data:213,
        num:444,
        age:12
    },
    {
        data:456,
        num:678,
        age:13
    }];

//写个接口123
app.get('/123',function(req,res){
    var urlPath = url.parse(req.url).pathname;
    var qs = querystring.parse(req.url.split('?')[1]);
  /*  if(urlPath === '/jsonp' && qs.callback){*/
        res.writeHead(200,{'Content-Type':'application/json;charset=utf-8'});
  
        db.query('select * from websites',function(results,fields){
            console.log(results);
            console.log(fields);

            data = JSON.stringify(fields);
            var callback = qs.callback+'('+data+');';
            res.end(callback);
        });
});

app.get('/email',function(req,res){
    var urlPath = url.parse(req.url).pathname;
    var qs = querystring.parse(req.url.split('?')[1]);
    /*  if(urlPath === '/jsonp' && qs.callback){*/
    res.writeHead(200,{'Content-Type':'application/json;charset=utf-8'});

    var usermess = {
        name : '123',
        usermess:'1234',
        email:qs.email
    }
    // 创建一个邮件对象
    var mail = {
        // 发件人
        from: '小静博客 <xiaojing@126.com>',
        // 主题
        subject: '激活账号',
        // 收件人
        to: usermess.email, //发送给注册时填写的邮箱
        // 邮件内容，HTML格式
        text: '点击激活：<a href="http://localhost:3000/checkCode?name='+ usermess.name +'&code='+ usermess.code + '"></a>'
    };

    send(mail);


});
//配置服务端口
var server = app.listen(3000, function () {

    var host = server.address().address;

    var port = server.address().port;

    console.log('Example app listening at http://%s:%s', host, port);
})

