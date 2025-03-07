// إرسال الرسالة
async function sendMessage() {
    const userInput = document.getElementById("user-input").value;
    if (!userInput) return;

    const chatBox = document.getElementById("chat-box");
    chatBox.innerHTML += `<div class="message user">${userInput}</div>`;

    document.getElementById("user-input").value = ""; 
    try {
        const response = await fetch("http://127.0.0.1:11434/api/generate", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({
                // TODO make model changable
                model: "llama3.2", 
                prompt: userInput,
                stream: false
            })
        });

        const data = await response.json();

        let text = data.response || "No response";

        let convertedHtml = marked.parse(text);

        chatBox.innerHTML += `<div>${convertedHtml}</div>`; // message bot

        chatBox.scrollTop = chatBox.scrollHeight;
    } catch (error) {
        console.log(error);
    }

    // Highlight code after message reseved
    highlightNewCode();
}

const userInput = document.getElementById('user-input');
userInput.addEventListener('input', function () {
    this.style.height = 'auto';
    this.style.height = (this.scrollHeight) + 'px'; 
});


// Function to toggle dark mode
function toggleDarkMode() {
    const body = document.body;
    body.classList.toggle('dark-mode'); 

    // Optionally, save the user's preference in localStorage
    if (body.classList.contains('dark-mode')) {
        localStorage.setItem('theme', 'dark');
        return
    }
    localStorage.setItem('theme', 'light');
}

// Check for user's saved theme preference (if any) when the page loads
window.onload = function() {
    const savedTheme = localStorage.getItem('theme');
    if (savedTheme === 'dark') {
        document.body.classList.add('dark-mode');
    }
}
 // handle & send query
userInput.addEventListener('keydown', function(event) {
    if ((event.metaKey || event.altKey ) && event.key === 'Enter' ) {
        console.log(userInput.value)
        sendMessage(userInput)
        return
    }
})


// Highlight code after page load
document.addEventListener("DOMContentLoaded", () => {
    document.querySelectorAll("pre code").forEach((block) => {
        hljs.highlightElement(block);
    });
});



// Highlight code after message reseved
function highlightNewCode() {
    document.querySelectorAll("pre code").forEach((block) => {
        hljs.highlightElement(block);
    });
}

