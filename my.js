fetch("https://jsonplaceholder.typicode.com/users")
  .then((response) => response.json())
  .then(
    (data) =>
      (document.getElementById("root").innerHTML = data
        .map(
          (item) => `
    <tr>
        <td>${item.id}</td>
        <td>${item.name}</td>
        <td>${item.username}</td>
        <td>${item.email}</td>
        <td>${item.address.city}</td>
    </tr>
`
        )
        .join(" "))
  );
