export function createResultList() {
    const resultList = document.createElement("ul");
    resultList.id = "resultList";
    Object.assign(resultList.style, {
        listStyleType: "none",
        padding: "0",
    });

    return resultList;
}

export const Stock = [
    { name: 'Сбер Банк', ticker: 'SBER' },
    { name: 'МТС', ticker: 'MTSS' },
    { name: 'Тинькофф групп', ticker: 'TCS' },
    { name: 'Московская биржа', ticker: 'MOEX' }
];

export function searchInNameReturnTicker(query) {
    query = query.toLowerCase();
    const filteredStock = Stock.filter(stock => stock.name.toLowerCase().includes(query));
    return filteredStock.map(stock => stock.ticker);
}

export function updateResults(searchInput, resultList) {
    const query = searchInput.value;
    const results = searchInNameReturnTicker(query);
    resultList.innerHTML = "";
    results.forEach(result => {
        const li = document.createElement("li");
        li.textContent = result;
        resultList.appendChild(li);
    });
}