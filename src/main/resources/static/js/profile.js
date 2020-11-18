window.onload = function() {
    const rankPopup = function() {
        const $rank_info_popup = document.querySelector("#rank-info-popup");

        $rank_info_popup.style.display = "none";
    };

    const $rank = document.querySelector("#rank");

    $rank.addEventListener("click", function(event) {
        rankPopup();
    });
};