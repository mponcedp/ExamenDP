const API_URL = 'https://my-json-server.typicode.com/dp-danielortiz/dptest_jsonplaceholder/items';

const HTMLResponse = document.querySelector('#app');
const ul = document.createElement('ul');
const xhr = new XMLHttpRequest();

function onRequestHandler() {
    if (this.readyState === 4 && this.status === 200) {

        const items = JSON.parse(this.response);
        const HTMLResponse = document.querySelector('#app');
        let tpl = '';

        items.forEach(item => {
            if (item.color === 'red') {
                tpl = `<li> id: ${item.id} </li><li> type: ${item.type}</li><li> color: ${item.color}</li>`;
            }
        });

        HTMLResponse.innerHTML = `<ul>${tpl}</ul>`;
    }
}

xhr.addEventListener("load", onRequestHandler);
xhr.open("GET", `${API_URL}`);
xhr.send();



