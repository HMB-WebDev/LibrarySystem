// Please see documentation at https://learn.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.
var category = document.getElementById("CategoryId");
var subCategory = document.getElementById("SubcategoryId");
if (category && subCategory) {
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
}

var questionsCont = document.getElementById("questions-container");
if (questionsCont) {
    var questions = data.items.map(ques => {
        questionsCont.append(Question(ques));
    });
    questionsCont.append(questions);
}

function Question  (quest) {
    const container = document.createElement("div");
    const title = document.createElement("a");
    const dateCreated = document.createElement("p");
    const tagsContainer = document.createElement("div");
    const link = document.createElement("a");
    container.classList.add("shadow-sm", "p-3", "mb-5", "rounded");
    title.href = "#";
    title.textContent = quest.title;
    title.classList.add("fs-6","fw-bold")
    dateCreated.textContent ="Created On: "+ Date(quest.creation_date);
    quest.tags.map(t => {
        const tag = document.createElement("p");
        tag.classList.add("badge", "bg-secondary","mx-1");
        tag.textContent = t;
        tagsContainer.append(tag);
    })
    link.href = quest.link;
    link.target = "_blank";
    link.textContent = "View on Stack Overflow"
    container.append(title);
    container.append(dateCreated);
    container.append(tagsContainer);
    container.append(link);
    return container;
}