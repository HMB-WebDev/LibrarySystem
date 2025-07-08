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
    title.href = `/home/getsoanswers?qid=${quest.question_id}&title=${quest.title}`;
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

function Answer(ans) {
    const container = document.createElement("div");
    const title = document.createElement("a");
    const dateCreated = document.createElement("p");
    const tagsContainer = document.createElement("div");
    const link = document.createElement("a");
    container.classList.add("shadow-sm", "p-3", "mb-5", "rounded");
    title.href = `/home/getsoanswers?qid=${ans.ansion_id}`;
    title.textContent = ans.title;
    title.classList.add("fs-6", "fw-bold")
    dateCreated.textContent = "Created On: " + Date(ans.creation_date);
    ans.tags.map(t => {
        const tag = document.createElement("p");
        tag.classList.add("badge", "bg-secondary", "mx-1");
        tag.textContent = t;
        tagsContainer.append(tag);
    })
    link.href = ans.link;
    link.target = "_blank";
    link.textContent = "View on Stack Overflow"
    container.append(title);
    container.append(dateCreated);
    container.append(tagsContainer);
    container.append(link);
    return container;
}


var answer= {
    "items": [
        {
            "owner": {
                "account_id": 22348623,
                "reputation": 960,
                "user_id": 16567210,
                "user_type": "registered",
                "profile_image": "https://www.gravatar.com/avatar/be445a9a1050fb97e18adf8fdae08033?s=256&d=identicon&r=PG",
                "display_name": "Manuel Glez",
                "link": "https://stackoverflow.com/users/16567210/manuel-glez"
            },
            "is_accepted": true,
            "score": 4,
            "last_activity_date": 1751961476,
            "last_edit_date": 1751961476,
            "creation_date": 1655716006,
            "answer_id": 72684643,
            "question_id": 72684314,
            "content_license": "CC BY-SA 4.0",
            "body": "<p>You can use Blade Facade.</p>\n<p>use Illuminate\\Support\\Facades\\Blade;</p>\n<pre class=\"lang-php prettyprint-override\"><code>use Illuminate\\Support\\Facades\\Blade;\n\n    public function __invoke()\n    {\n        $name='Peter Pan';\n        return Blade::render(&quot;\n        &lt;h1&gt; Hello {{$name}} &lt;/h1&gt;\n        &quot;,['name'=&gt;$name]);\n    }\n</code></pre>\n"
        },
        {
            "owner": {
                "account_id": 1051439,
                "reputation": 25787,
                "user_id": 1055279,
                "user_type": "registered",
                "accept_rate": 99,
                "profile_image": "https://www.gravatar.com/avatar/13ac92a723e01487c1e6052d2c318353?s=256&d=identicon&r=PG",
                "display_name": "realtebo",
                "link": "https://stackoverflow.com/users/1055279/realtebo"
            },
            "is_accepted": false,
            "score": 2,
            "last_activity_date": 1655716688,
            "last_edit_date": 1655716688,
            "creation_date": 1655715537,
            "answer_id": 72684554,
            "question_id": 72684314,
            "content_license": "CC BY-SA 4.0",
            "body": "<p>Found</p>\n<p>We can use <code>\\Illuminate\\View\\Compilers\\BladeCompiler::render($string, $data)</code></p>\n<p>Where</p>\n<ul>\n<li><code>$string</code> is the text to parse, for example\n<code>Hi {{$username}}</code></li>\n<li><code>$data</code> is the same associate array we could normally pass down to <code>view()</code> helper, for example <code>[ 'username' =&gt; $this-&gt;email ] </code></li>\n</ul>\n<p>I was missing this from the official doc: <a href=\"https://laravel.com/docs/9.x/blade#rendering-inline-blade-templates\" rel=\"nofollow noreferrer\">https://laravel.com/docs/9.x/blade#rendering-inline-blade-templates</a></p>\n<p>So we can also use</p>\n<p><code>use Illuminate\\Support\\Facades\\Blade</code>;</p>\n<p><code>Blade::render($string, $data)</code></p>\n"
        }
    ],
        "has_more": false,
            "quota_max": 300,
                "quota_remaining": 280
}