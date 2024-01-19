import { mysite_backend } from "../../declarations/mysite_backend";

let reload = async () => {
  let list = await mysite_backend.timeline(0);
  let array = [];
  list.forEach(item => {
    array.push(`
      <div>
        <div>${item.text}</div>
        <div>${item.time}</div>
        <div>${item.author}</div>
      </div>
    `);
  });
  document.getElementById("content").innerHTML = array.join("<hr/>");
}
reload();

document.querySelector("form").addEventListener("submit", async (e) => {
  e.preventDefault();
  const button = e.target.querySelector("button");

  const input = document.getElementById("input").value.toString();

  button.setAttribute("disabled", true);

  // Interact with foo actor, calling the greet method
  await mysite_backend.post(input);
  await reload();

  button.removeAttribute("disabled");
  return false;
});
