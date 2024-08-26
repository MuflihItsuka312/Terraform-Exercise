#!/bin/bash

# Update the package list
sudo apt-get update

# Install Apache
sudo apt-get install -y apache2

# Enable Apache to start on boot
sudo systemctl enable apache2

# Start Apache service
sudo systemctl start apache2

# Create a simple HTML file
echo "<html>
<head>
    <title>Welcome to My Web Page</title>
</head>
<body>
    <h1>Hello, World!</h1>
    <p>This is a simple web page hosted on Apache.</p>
</body>
</html>" | sudo tee /var/www/html/index.html > /dev/null

# Restart Apache to ensure the new page is served
sudo systemctl restart apache2

# Output the status of Apache and where to access the web page
echo "Apache has been installed and a simple web page is being hosted."
echo "You can access it via http://your_server_ip/"

