async function sendMessage() {
    const userInputElement = document.getElementById("user-input");
    const userInput = userInputElement.value;
    if (!userInput) return;

    const chatBox = document.getElementById("chat-box");
    chatBox.innerHTML += `<div class="message user">${userInput}</div>`;
    chatBox.scrollTop = chatBox.scrollHeight;

    userInputElement.value = "";

    // إعادة تعيين ارتفاع textarea إلى الوضع الافتراضي بعد الإرسال
    userInputElement.style.height = "auto";

    // Create a loading indicator element
    let loadingDots = document.createElement("div");
    loadingDots.classList.add("loading-dots");
    chatBox.appendChild(loadingDots);
    animateLoadingDots(loadingDots); // Activate animation

    try {
        const response = await fetch("http://127.0.0.1:11434/api/generate", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({
                model: "gemma3:1b",
                prompt: userInput,
                stream: false
            })
        });

        const data = await response.json();
        let text = data.response || "No response";
        let convertedHtml = marked.parse(text);

        // Replace the loading indicator with the actual response
        loadingDots.outerHTML = `<div class="message bot">${convertedHtml}</div>`;

        chatBox.scrollTop = chatBox.scrollHeight;
    } catch (error) {
        console.log(error);
        loadingDots.outerHTML = `<div class="message bot error">⚠️ An error occurred while fetching the response</div>`;
    }

    // Highlight code after receiving the message
    highlightNewCode();
}

// Add copy button to all code blocks
function addCopyButtons() {
    document.querySelectorAll("pre code").forEach((block) => {
        let copyButton = document.createElement("button");
        copyButton.className = "copy-btn";
        copyButton.innerText = "Copy";
        
        copyButton.addEventListener("click", () => {
            copyCodeToClipboard(block, copyButton);
        });

        let preElement = block.parentElement;
        preElement.style.position = "relative";
        preElement.appendChild(copyButton);
    });
}

// Copy code to clipboard and show feedback
function copyCodeToClipboard(codeBlock, button) {
    let text = codeBlock.innerText;
    navigator.clipboard.writeText(text).then(() => {
        button.innerText = "Copied!";
        setTimeout(() => {
            button.innerText = "Copy";
        }, 2000);
    }).catch(err => console.error("Error copying text:", err));
}

// Run after page loads
document.addEventListener("DOMContentLoaded", () => {
    highlightNewCode(); // Highlight existing code
    addCopyButtons();   // Add copy buttons
});



// Loading dots animation
function animateLoadingDots(element) {
    let count = 0;
    let dots = ["○ ○ ○ ○ ○", "● ○ ○ ○ ○", "● ● ○ ○ ○", "● ● ● ○ ○", "● ● ● ● ○", "● ● ● ● ●"];
    let animation = setInterval(() => {
        element.innerHTML = dots[count % dots.length];
        count++;
    }, 500); // Change every 500 milliseconds

    // Stop loading animation when response is received
    element.dataset.animation = animation;
}

// Adjust input field height dynamically
const userInput = document.getElementById('user-input');
userInput.addEventListener('input', function () {
    this.style.height = 'auto';
    this.style.height = (this.scrollHeight) + 'px';
});

// Toggle dark mode
function toggleDarkMode() {
    const body = document.body;
    body.classList.toggle('dark-mode');
    localStorage.setItem('theme', body.classList.contains('dark-mode') ? 'dark' : 'light');
}

// Restore dark mode preference on page load
window.onload = function() {
    if (localStorage.getItem('theme') === 'dark') {
        document.body.classList.add('dark-mode');
    }
};

// Send message when pressing `Alt + Enter` or `Cmd + Enter`
userInput.addEventListener('keydown', function(event) {
    if ((event.metaKey || event.altKey) && event.key === 'Enter') {
        sendMessage();
    }
});

// Highlight newly received code snippets
function highlightNewCode() {
    document.querySelectorAll("pre code").forEach((block) => {
        hljs.highlightElement(block);
    });
}

// Highlight code snippets after the page loads
document.addEventListener("DOMContentLoaded", () => {
    document.querySelectorAll("pre code").forEach((block) => {
        hljs.highlightElement(block);
    });
});

