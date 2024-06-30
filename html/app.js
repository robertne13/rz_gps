var active = false;

window.addEventListener("message", function(event) {
    var v = event.data
    let bank = event.data.bank;

    switch (v.action) {
        case "show":
            console.log("SHOW");
        if (active === false ) {
            $('.label-coords').text(v.code + v.meters);
            $(".box").css({
                "border-color": v.style,
                "background-color": v.styleBack,
                "color": v.fontColor
            });
            $(".arrow").css({
                "border-top": "10px solid " + v.style,
            });

            $(".box").css("display", "flex");
            active = true;
            setTimeout(function() {
                $(".box").css("display", "none");
                active = false;
            }, v.opentime);
        }
        else {

        }
        case "updatecoords":
            $('.label-coords').text(v.code + v.meters);
        break;

    }
});