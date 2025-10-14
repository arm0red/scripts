#!/bin/bash

# A menu-driven script to manage Ollama and Open WebUI services.

# This infinite loop ensures the menu is redisplayed after each command execution.
while true; do
    # Clear the terminal screen for a clean menu display.
    clear
    
    # Display the menu options to the user.
    echo "========================================="
    echo "    Ollama & Open WebUI Control Menu     "
    echo "========================================="
    echo "1. Start Ollama Service (via just)"
    echo "2. Run Open WebUI Container"
    echo "3. Pull Latest Open WebUI Image"
    echo "-----------------------------------------"
    echo "q. Quit"
    echo "========================================="
    
    # Prompt the user to enter their choice.
    read -p "Enter your choice [1-3 or q]: " choice
    
    # Add a newline for better spacing and readability.
    echo
    
    # Use a case statement to determine which command to run based on the user's choice.
    case $choice in
        1)
            echo "-> Starting Ollama service using 'just'..."
            # This command assumes you have 'just' installed and the specified Justfile is in the correct path.
            just --justfile bluefin-tools.just ollama
            echo "-> Ollama service command executed."
            ;;
            
        2)
            echo "-> Running the Open WebUI podman container..."
            # This command starts the Open WebUI container with persistent data and network access.
            podman run -d --network=host -v open-webui:/app/backend/data -e OLLAMA_BASE_URL=http://127.0.0.1:11434 --name open-webui --restart always ghcr.io/open-webui/open-webui:main
            echo "-> Podman 'run' command for Open WebUI has been executed."
            echo "-> Use 'podman ps' to check container status."
            ;;
            
        3)
            echo "-> Pulling the latest Open WebUI image from ghcr.io..."
            # This ensures you have the most recent version of the WebUI image.
            podman pull ghcr.io/open-webui/open-webui:main
            echo "-> Podman 'pull' command executed."
            ;;
            
        q|Q)
            echo "Exiting the script. Goodbye!"
            # The 'break' command exits the while loop, terminating the script.
            break
            ;;
            
        *) # This is a wildcard that catches any input not matched by the cases above.
            echo "Invalid option. Please select a valid number or 'q'."
            ;;
    esac
    
    echo
    # Pause the script and wait for the user to press Enter before looping back to the menu.
    read -p "Press [Enter] to return to the menu..."
    
done
```

I've created a bash script for you named `ollama_menu.sh`.

### How to Use It

1.  **Save the File**: Copy the code from the file block above and save it as `ollama_menu.sh` on your system.
2.  **Make it Executable**: Open your terminal, navigate to where you saved the file, and run this command:
    ```bash
    chmod +x ollama_menu.sh
    ```
3.  **Run the Script**: Execute the script with the following command:
    ```bash
    ./ollama_menu.sh
    
