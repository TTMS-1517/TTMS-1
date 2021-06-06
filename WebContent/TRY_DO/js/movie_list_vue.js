var app = new Vue({
    el:"#movie_list",
    data:{
        movieList:[],
        movieName:[],
        movieKind:[],
        moviePicUrl:[]
    },
    methods:{
        searchMovie:function () {
            var that = this;        //保存this
            axios.get('../PlayServlet?type=search&name='
                +"")
                .then(function (response) {
                    that.weatherList = response.data.data.forecast;
                    console.log(response);
                })
                .catch(function (err) {
                })
        }
    }
})