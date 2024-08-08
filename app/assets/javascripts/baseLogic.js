export function createSearchButton() {
    const button = document.createElement("button");
    button.textContent = "Поиск";
    button.id = "searchButton";
    Object.assign(button.style, {
        backgroundColor: "rgb(147, 51, 234)",
        color: "white",
        border: "none",
        borderRadius: "5px",
        padding: "20px 30px",
        fontFamily: "ui-sans-serif, system-ui, sans-serif, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji",
        fontSize: "20px",
        fontWeight: "bold",
        position: "fixed",
        bottom: "20px",
        right: "20px",
        display: "none",
        transition: "background-color 0.3s ease",
    });

    button.addEventListener("mouseover", function() {
        button.style.backgroundColor = "rgb(128, 45, 204)";
    });

    button.addEventListener("mouseout", function() {
        button.style.backgroundColor = "rgb(147, 51, 234)";
    });

    button.addEventListener("focus", function() {
        button.style.outline = "none";
        button.style.boxShadow = "0 0 0 2px white, 0 0 0 4px rgba(147, 51, 234, 0.5)";
    });

    button.addEventListener("blur", function() {
        button.style.boxShadow = "none";
    });

    return button;
}

export function createOutputWindow() {
    const outputWindow = document.createElement("div");
    outputWindow.id = "outputWindow";
    Object.assign(outputWindow.style, {
        position: "fixed",
        bottom: "100px",
        right: "20px",
        backgroundColor: "rgb(255, 255, 255)",
        border: "1px solid rgb(204, 204, 204)",
        borderRadius: "10px",
        padding: "40px",
        boxShadow: "0px 2px 5px rgb(147, 51, 234)",
        display: "none",
    });

    return outputWindow;
}

export function createCloseIconToButton() {
    const closeButton = document.createElement("span");
    closeButton.textContent = "×";
    closeButton.id = "closeIconToButton";
    Object.assign(closeButton.style, {
        position: "absolute",
        top: "10px",
        right: "20px",
        cursor: "pointer",
        fontSize: "24px",
    });

    return closeButton;
}