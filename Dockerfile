FROM langflowai/langflow:latest

# Create flows directory
RUN mkdir -p /app/flows

# Set working directory
WORKDIR /app

# Set environment variables
ENV PORT=7860
ENV HOST=0.0.0.0

EXPOSE ${PORT}

CMD ["langflow", "run", "--host", "0.0.0.0", "--port", "7860"]

