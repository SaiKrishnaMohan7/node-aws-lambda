FROM public.ecr.aws/lambda/nodejs:18

# Set working directory
WORKDIR /var/task

# Copy app code
COPY main.js ./
COPY package.json ./

# Optional: if using TypeScript
# COPY dist/ ./

# Lambda entry point
CMD ["main.handler"]
