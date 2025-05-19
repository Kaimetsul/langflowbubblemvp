FROM langflowai/langflow:latest

# Create flows directory
RUN mkdir -p /app/flows

# Set working directory
WORKDIR /app

# Set environment variables
ENV PORT=8080
ENV HOST=0.0.0.0
ENV LANGFLOW_MEMORY_LIMIT=3GB
ENV LANGFLOW_FLOWS_DIR=/app/flows

EXPOSE ${PORT}

# Copy flow file
COPY flows/Langflowmvp.json /app/flows/

CMD ["langflow", "run", "--host", "0.0.0.0", "--port", "8080"]

