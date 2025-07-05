// Please see documentation at https://learn.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.
var category = document.getElementById("CategoryId");
var subCategory = document.getElementById("SubcategoryId");
category.addEventListener("change", async (e) => {
    await fetch("/home/getSubCategory/" + e.target.value).then(resp => resp.json()).then(data => {
        while (subCategory.firstChild) {
            subCategory.removeChild(subCategory.firstChild);
        }
        var listItem = document.createElement("option");
        listItem.value = "";
        listItem.textContent = "--Select Sub-Category";
        subCategory.append(listItem);
        for (var item of data) {
            console.log(item);
            var listItem = document.createElement("option");
            listItem.value = item.id;
            listItem.textContent = item.name
            subCategory.append(listItem);
        }
    })

});