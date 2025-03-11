async function sendMessage() {
    const userInput = document.getElementById("user-input").value;
    if (!userInput) return;

    const chatBox = document.getElementById("chat-box");
    chatBox.innerHTML += `<div class="message user">${userInput}</div>`;
    chatBox.scrollTop = chatBox.scrollHeight;

    document.getElementById("user-input").value = "";

    // ✅ إنشاء عنصر مؤشر التحميل
    let loadingDots = document.createElement("div");
    loadingDots.classList.add("loading-dots");
    chatBox.appendChild(loadingDots);
    animateLoadingDots(loadingDots); // ✅ تفعيل الحركة

    try {
        const response = await fetch("http://127.0.0.1:11434/api/generate", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({
                model: "llama3.2",
                prompt: userInput,
                stream: false
            })
        });

        const data = await response.json();
        let text = data.response || "No response";
        let convertedHtml = marked.parse(text);

        // ✅ استبدال مؤشر التحميل بالرد الفعلي
        loadingDots.outerHTML = `<div class="message bot">${convertedHtml}</div>`;

        chatBox.scrollTop = chatBox.scrollHeight;
    } catch (error) {
        console.log(error);
        loadingDots.outerHTML = `<div class="message bot error">⚠️ حدث خطأ أثناء جلب الرد</div>`;
    }

    // ✅ تلوين الكود بعد استلام الرسالة
    highlightNewCode();
}

// ✅ حركة نقاط التحميل
function animateLoadingDots(element) {
    let count = 0;
    let dots = ["○ ○ ○ ○ ○", "● ○ ○ ○ ○", "● ● ○ ○ ○", "● ● ● ○ ○", "● ● ● ● ○", "● ● ● ● ●"];
    let animation = setInterval(() => {
        element.innerHTML = dots[count % dots.length];
        count++;
    }, 500); // ✅ تغيير كل 500 مللي ثانية

    // ✅ إيقاف التحميل عند تلقي الرد
    element.dataset.animation = animation;
}

// ✅ تحسين إدخال النص
const userInput = document.getElementById('user-input');
userInput.addEventListener('input', function () {
    this.style.height = 'auto';
    this.style.height = (this.scrollHeight) + 'px';
});

// ✅ تبديل الوضع الداكن
function toggleDarkMode() {
    const body = document.body;
    body.classList.toggle('dark-mode');
    localStorage.setItem('theme', body.classList.contains('dark-mode') ? 'dark' : 'light');
}

// ✅ استعادة الوضع الداكن عند تحميل الصفحة
window.onload = function() {
    if (localStorage.getItem('theme') === 'dark') {
        document.body.classList.add('dark-mode');
    }
};

// ✅ إرسال الرسالة عند الضغط على `Alt + Enter` أو `Cmd + Enter`
userInput.addEventListener('keydown', function(event) {
    if ((event.metaKey || event.altKey) && event.key === 'Enter') {
        sendMessage();
    }
});

// ✅ تلوين الأكواد الجديدة بعد استلام الرسائل
function highlightNewCode() {
    document.querySelectorAll("pre code").forEach((block) => {
        hljs.highlightElement(block);
    });
}

// ✅ تلوين الأكواد بعد تحميل الصفحة
document.addEventListener("DOMContentLoaded", () => {
    document.querySelectorAll("pre code").forEach((block) => {
        hljs.highlightElement(block);
    });
});



/*
 async function sendMessage() {
    const userInput = document.getElementById("user-input").value;
    if (!userInput) return;

    const chatBox = document.getElementById("chat-box");
    chatBox.innerHTML += `<div class="message user">${userInput}</div>`;
    chatBox.scrollTop = chatBox.scrollHeight;

    document.getElementById("user-input").value = "";

    // ✅ إنشاء عنصر مؤشر التحميل
    let loadingDots = document.createElement("div");
    loadingDots.classList.add("loading-dots");
    chatBox.appendChild(loadingDots);
    animateLoadingDots(loadingDots); // ✅ تفعيل الحركة

    try {
        const response = await fetch("http://127.0.0.1:11434/api/generate", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({
                model: "llama3.2",
                prompt: userInput,
                stream: false
            })
        });

        const data = await response.json();
        let text = data.response || "No response";
        let convertedHtml = marked.parse(text);

        // ✅ استبدال مؤشر التحميل بالرد الفعلي
        loadingDots.outerHTML = `<div class="message bot">${convertedHtml}</div>`;

        chatBox.scrollTop = chatBox.scrollHeight;
    } catch (error) {
        console.log(error);
        loadingDots.outerHTML = `<div class="message bot error">⚠️ حدث خطأ أثناء جلب الرد</div>`;
    }

    // ✅ تلوين الكود بعد استلام الرسالة
    highlightNewCode();
}

// ✅ حركة نقاط التحميل
function animateLoadingDots(element) {
    let count = 0;
    let dots = ["● ○ ○ ○ ○", "● ● ○ ○ ○", "● ● ● ○ ○", "● ● ● ● ○", "● ● ● ● ●"];
    let animation = setInterval(() => {
        element.innerHTML = dots[count % dots.length];
        count++;
    }, 500); // ✅ تغيير كل 500 مللي ثانية

    // ✅ إيقاف التحميل عند تلقي الرد
    element.dataset.animation = animation;
}

// ✅ تحسين إدخال النص
const userInput = document.getElementById('user-input');
userInput.addEventListener('input', function () {
    this.style.height = 'auto';
    this.style.height = (this.scrollHeight) + 'px';
});

// ✅ تبديل الوضع الداكن
function toggleDarkMode() {
    const body = document.body;
    body.classList.toggle('dark-mode');
    localStorage.setItem('theme', body.classList.contains('dark-mode') ? 'dark' : 'light');
}

// ✅ استعادة الوضع الداكن عند تحميل الصفحة
window.onload = function() {
    if (localStorage.getItem('theme') === 'dark') {
        document.body.classList.add('dark-mode');
    }
};

// ✅ إرسال الرسالة عند الضغط على `Alt + Enter` أو `Cmd + Enter`
userInput.addEventListener('keydown', function(event) {
    if ((event.metaKey || event.altKey) && event.key === 'Enter') {
        sendMessage();
    }
});

// ✅ تلوين الأكواد الجديدة بعد استلام الرسائل
function highlightNewCode() {
    document.querySelectorAll("pre code").forEach((block) => {
        hljs.highlightElement(block);
    });
}

// ✅ تلوين الأكواد بعد تحميل الصفحة
document.addEventListener("DOMContentLoaded", () => {
    document.querySelectorAll("pre code").forEach((block) => {
        hljs.highlightElement(block);
    });
});

 *
 * end
 *
 *
 */
