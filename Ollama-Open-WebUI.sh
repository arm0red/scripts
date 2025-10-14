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
    echo "4. Update Open WebUI Container"
    echo "-----------------------------------------"
    echo "q. Quit"
    echo "========================================="
    
    # Prompt the user to enter their choice.
    read -p "Enter your choice [1-4 or q]: " choice
    
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
            
        4)
            echo "-> Updating the Open WebUI container..."
            echo "--> Pulling the latest image..."
            podman pull ghcr.io/open-webui/open-webui:main
            
            echo "--> Stopping the current container..."
            # The '|| true' part ensures that the script doesn't exit with an error if the container isn't running.
            podman stop open-webui || true
            
            echo "--> Removing the old container..."
            # The '|| true' part ensures that the script doesn't exit with an error if the container doesn't exist.
            podman rm open-webui || true
            
            echo "--> Starting the new container with the updated image..."
            podman run -d --network=host -v open-webui:/app/backend/data -e OLLAMA_BASE_URL=http://127.0.0.1:11434 --name open-webui --restart always ghcr.io/open-webui/open-webui:main
            
            echo "-> Open WebUI container update process is complete."
            echo "-> Use 'podman ps' to check the new container's status."
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
