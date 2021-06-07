UrlParm = function() { // url参数
    var data, index;
    (function init() {
        data = [];
        index = {};
        var u = window.location.search.substr(1);
        if (u != '') {
            var parms = decodeURIComponent(u).split('&');
            for (var i = 0, len = parms.length; i < len; i++) {
                if (parms[i] != '') {
                    var p = parms[i].split("=");
                    if (p.length == 1 || (p.length == 2 && p[1] == '')) {// p | p=
                        data.push([ '' ]);
                        index[p[0]] = data.length - 1;
                    } else if (typeof (p[0]) == 'undefined' || p[0] == '') { // =c | =
                        data[0] = [ p[1] ];
                    } else if (typeof (index[p[0]]) == 'undefined') { // c=aaa
                        data.push([ p[1] ]);
                        index[p[0]] = data.length - 1;
                    } else {// c=aaa
                        data[index[p[0]]].push(p[1]);
                    }
                }
            }
        }
    })();
    return {
        // 获得参数
        parm : function(o) { // o: 参数名或者参数次序
            try {
                return (typeof (o) == 'number' ? data[o][0] : data[index[o]][0]);
            } catch (e) {
            }
        },
        //获得参数组, 类似request.getParameterValues()
        parmValues : function(o) { //  o: 参数名或者参数次序
            try {
                return (typeof (o) == 'number' ? data[o] : data[index[o]]);
            } catch (e) {
            }
        },
        //是否含有parmName参数
        hasParm : function(parmName) {
            return typeof (parmName) == 'string' ? typeof (index[parmName]) != 'undefined' : false;
        },
        // 获得参数Map ,类似request.getParameterMap()
        parmMap : function() {
            var map = {};
            try {
                for ( var p in index) {
                    map[p] = data[index[p]];
                }
            } catch (e) {
            }
            return map;
        }
    }
}();

function init(){
    var playname = UrlParm.parm("name");
    searchMovieContent(playname);
}

function searchMovieContent(playName){
    var url = "../PlayServlet";
    if (window.XMLHttpRequest)
        req = new XMLHttpRequest();
    else if (window.ActiveXObject)
        req = new ActiveXObject("Microsoft.XMLHTTP");
    if (req) {
        //采用POST方式，异步传输
        req.open("post", url, true);
        //POST方式，必须加入如下头信息设定
        req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        req.onreadystatechange = searchMovieContComplete;
        req.send("type=search&name=" + playName);
    }
}


function searchMovieContComplete() {
    if (req.readyState == 4 && req.status == 200) {
        var movieschelist = document.getElementById("movie_sche");
        var json = JSON.parse(req.responseText);//转换为json对象
        var tmp = json[0].id;
        console.log(json);
        document.getElementsByTagName("title")[0].innerText = json[0].name;
        movieschelist.innerHTML = '<div id="back-color">' +
            '                <img src="' + json[0].imgbg + '" alt="">' +
            '            </div>' +
            '            <div class="op-2">' +
            '                <div class="container">' +
            '                    <div class="row">' +
            '                        <div class="col-3">' +
            '                          <img src="' + json[0].img + '" alt="" class="img-thumbnail">' +
            '                        </div>' +
            '                        <div class="col-4">' +
            '                          <h1 class="display-5">' + json[0].name + '</h1>' +
            '                          <br class="my-4">' +
            '                          <p class="mt-5">' + json[0].kind + '</p>' +
            '                          <p>' + json[0].length + '分钟</p>' +
            '                          <div class="kuai-1">' +
            '                            <p>' +
            '                            <div class="kuai-4">' +
            '                              <div class="kuai-2">' +
            '                                <button type="button" class="btn btn-primary btn-block">想看</button>' +
            '                              </div>' +
            '                              <div class="kuai-3">' +
            '                                <button type="button" class="btn btn-primary btn-block">评分</button>' +
            '                              </div>' +
            '                            </div>' +
            '                            </p>' +
            '                            <br><br>' +
            '                            <p>' +
            '                              <button type="button" class="btn btn-primary btn-lg btn-block">特惠购票</button>' +
            '                            </p>' +
            '                          </div>' +
            '                        </div>' +
            '                        <div class="col-5">' +
            '                          <div class="brief">' +
            '                            <p>' + json[0].intro + '</p>' +
            '                          </div>' +
            '                        </div>' +
            '                    </div>' +
            '                </div>' +
            '            </div>'
    }
}




