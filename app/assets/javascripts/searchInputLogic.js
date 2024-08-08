export function createSearchInput() {
    const searchInput = document.createElement("input");
    searchInput.id = "searchInput";
    searchInput.placeholder = "Поиск";
    Object.assign(searchInput.style, {
        width: "100%",
        padding: "10px",
        fontSize: "16px",
        marginBottom: "20px",
        border: "1px solid rgb(204, 204, 204)",
        borderRadius: "5px",
        transition: "border-color 0.3s ease, box-shadow 0.3s ease",
    });

    searchInput.addEventListener("focus", function() {
        searchInput.style.borderColor = "rgb(147, 51, 234)";
        searchInput.style.boxShadow = "0px 2px 5px rgb(147, 51, 234)";
        searchInput.style.outline = "none";
    });

    searchInput.addEventListener("blur", function() {
        searchInput.style.borderColor = "rgb(204, 204, 204)";
        searchInput.style.boxShadow = "none";
    });

    return searchInput;
}

