# Use an official Node.js runtime as a parent image
FROM node:18

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install application dependencies
RUN npm install

# Bundle your app source code into the container
COPY . .

# Expose the port that your Express app will run on
EXPOSE 3050

# Install PM2 globally
RUN npm install -g pm2

# Start your Express app using PM2
CMD ["pm2-runtime", "app.js"]
