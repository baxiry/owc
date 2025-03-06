// إرسال الرسالة
async function sendMessage() {
    const userInput = document.getElementById("user-input").value;
    if (!userInput) return;

    const chatBox = document.getElementById("chat-box");
    chatBox.innerHTML += `<div class="message user">${userInput}</div>`;

    document.getElementById("user-input").value = ""; // مسح حقل النص

    try {
        const response = await fetch("http://127.0.0.1:11434/api/generate", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({
                model: "llama3.2", // تأكد من أنك تستخدم النموذج الصحيح
                prompt: userInput,
                stream: false
            })
        });

        const data = await response.json();



        let text = data.response || "No response";


        let convertedHtml = marked.parse(text);

        chatBox.innerHTML += `<div class="">${convertedHtml}</div>`; // message bot

        // جعل التمرير لأسفل عند إضافة رسالة جديدة
        chatBox.scrollTop = chatBox.scrollHeight;
    } catch (error) {
        console.log(error);
    }
}

// توسيع حقل النص حسب الأسطر المكتوبة
const userInput = document.getElementById('user-input');
userInput.addEventListener('input', function () {
    this.style.height = 'auto'; // إعادة تعيين الارتفاع التلقائي
    this.style.height = (this.scrollHeight) + 'px'; // تعيين الارتفاع حسب النص
});


// Function to toggle dark mode
function toggleDarkMode() {
    const body = document.body;
    body.classList.toggle('dark-mode'); // Toggle the dark-mode class

    // Optionally, save the user's preference in localStorage
    if (body.classList.contains('dark-mode')) {
        localStorage.setItem('theme', 'dark');
    } else {
        localStorage.setItem('theme', 'light');
    }
}

// Check for user's saved theme preference (if any) when the page loads
window.onload = function() {
    const savedTheme = localStorage.getItem('theme');
    if (savedTheme === 'dark') {
        document.body.classList.add('dark-mode');
    }
};

