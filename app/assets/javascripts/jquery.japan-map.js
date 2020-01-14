$(function(){

    var areas = [
        {code: 1 , name:"北海道地方", color:"#ca93ea", hoverColor:"#e0b1fb", prefectures:[1]},
        {code: 2 , name:"東北地方", color:"#a7a5ea", hoverColor:"#d6d4fd", prefectures:[2,3,4,5,6,7]},
        {code: 3 , name:"関東地方", color:"#84b0f6", hoverColor:"#c1d8fd", prefectures:[8,9,10,11,12,13,14]},
        {code: 4 , name:"北陸・甲信越地方", color:"#52d49c", hoverColor:"#93ecc5", prefectures:[15,16,17,18,19,20]},
        {code: 4 , name:"東海地方", color:"#77e18e", hoverColor:"#aff9bf", prefectures:[21,22,23,24]},
        {code: 6 , name:"近畿地方", color:"#f2db7b", hoverColor:"#f6e8ac", prefectures:[25,26,27,28,29,30]},
        {code: 7 , name:"中国地方", color:"#f9ca6c", hoverColor:"#ffe5b0", prefectures:[31,32,33,34,35]},
        {code: 8 , name:"四国地方", color:"#fbad8b", hoverColor:"#ffd7c5", prefectures:[36,37,38,39]},
        {code: 9 , name:"九州地方", color:"#f7a6a6", hoverColor:"#ffcece", prefectures:[40,41,42,43,44,45,46]},
        {code:10 , name:"沖縄地方", color:"#ea89c4", hoverColor:"#fdcae9", prefectures:[47]}
    ];

    $("#map-container").japanMap(
        {
          areas  : areas,
          selection : "area",
          borderLineWidth: 0.25,
          drawsBoxLine : false,
          movesIslands : true,
          showsAreaName : true,
          width: 800,
          font : "MS Mincho",
          fontSize : 12,
          fontColor : "areaColor",
          fontShadowColor : "black",
          onSelect:function(data){
            window.location.href = 'maps/' + data.code ;
          },
        }
    );
});

// $(function(){
//     var areas = [
//         {code : 1, name: "北海道地方", color: "#7f7eda", hoverColor: "#b3b2ee", prefectures: [1]},
//         {code : 2, name: "東北地方",   color: "#759ef4", hoverColor: "#98b9ff", prefectures: [2,3,4,5,6,7]},
//         {code : 3, name: "関東地方",   color: "#7ecfea", hoverColor: "#b7e5f4", prefectures: [8,9,10,11,12,13,14]},
//         {code : 4, name: "中部地方",   color: "#7cdc92", hoverColor: "#aceebb", prefectures: [15,16,17,18,19,20,21,22,23]},
//         {code : 5, name: "近畿地方",   color: "#ffe966", hoverColor: "#fff19c", prefectures: [24,25,26,27,28,29,30]},
//         {code : 6, name: "中国地方",   color: "#ffcc66", hoverColor: "#ffe0a3", prefectures: [31,32,33,34,35]},
//         {code : 7, name: "四国地方",   color: "#fb9466", hoverColor: "#ffbb9c", prefectures: [36,37,38,39]},
//         {code : 8, name: "九州地方",   color: "#ff9999", hoverColor: "#ffbdbd", prefectures: [40,41,42,43,44,45,46]},
//         {code : 9, name: "沖縄地方",   color: "#eb98ff", hoverColor: "#f5c9ff", prefectures: [47]},
//     ];

//     $("#map-container").japanMap({
//         width: 800,
//                   selection: "area",
//         areas: areas,
//         backgroundColor : "#f2fcff",
//         borderLineColor: "#f2fcff",
//         borderLineWidth : 0.25,
//         lineColor : "#a0a0a0",
//                   lineWidth: 1,
//                   drawsBoxLine: true,
//                   showsPrefectureName: true,
//                   prefectureNameType: "short",
//         movesIslands : true,
//         fontSize : 11,
//         onSelect : function(data){
//             alert(data.name);
//         }
//     });
// });