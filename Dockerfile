FROM langflowai/langflow:latest

# Create flows directory
RUN mkdir -p /app/flows

# Set working directory
WORKDIR /app

EXPOSE 7860

CMD ["langflow", "run", "--host", "0.0.0.0", "--port", "7860"]

