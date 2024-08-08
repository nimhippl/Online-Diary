import { createSearchButton, createOutputWindow, createCloseIconToButton } from './baseLogic.js';
import { createSearchInput } from './searchInputLogic.js';
import { createResultList, updateResults } from './searchCoreLogic.js';

document.addEventListener("DOMContentLoaded", function() {
    const searchButton = createSearchButton();
    const outputWindow = createOutputWindow();
    const closeButton = createCloseIconToButton();
    const searchInput = createSearchInput();
    const resultList = createResultList();

    outputWindow.appendChild(closeButton);
    outputWindow.appendChild(searchInput);
    outputWindow.appendChild(resultList);

    document.body.appendChild(searchButton);
    document.body.appendChild(outputWindow);

    searchInput.addEventListener("input", function() {
        updateResults(searchInput, resultList);
    });

    setTimeout(function() {
        searchButton.style.display = "block";
    }, 5000);

    searchButton.addEventListener("click", function() {
        searchButton.style.display = "none";
        outputWindow.style.display = "block";
        updateResults(searchInput, resultList);
    });

    closeButton.addEventListener("click", function() {
        outputWindow.style.display = "none";
        searchButton.style.display = "block";
    });
});