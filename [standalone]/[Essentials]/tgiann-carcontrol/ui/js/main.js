window.addEventListener('message', (event) => {
    if (event.data.type === 'open') {
        $(".ana").fadeIn();
    } else if (event.data.type === 'close') {
        close();
    } else if (event.data.type === 'update') {
        let data = event.data.data
        for (x in data) {
            changeStatus(x, data[x])
        }
    }
});

function changeStatus(dclass, status) {
    if (status == "pasif") {
        $("#"+dclass+" .button-cizgi").addClass("pasif");
        $("#"+dclass+" .button-cizgi").removeClass("aktif");
    } else if (status) {
        $("#"+dclass+" .button-cizgi").addClass("aktif");
        $("#"+dclass+" .button-cizgi").removeClass("pasif");
    } else {
        $("#"+dclass+" .button-cizgi").removeClass("aktif");
        $("#"+dclass+" .button-cizgi").removeClass("pasif");
    }
}

function close() {
    $(".ana").fadeOut();
    $.post('https://tgiann-carcontrol/kapat')
}

$(document).on("click", ".button", function() {
    $.post('https://tgiann-carcontrol/set', JSON.stringify({tip: this.id}));
});
