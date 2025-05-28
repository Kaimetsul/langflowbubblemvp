FROM langflowai/langflow:latest

# Create directories for persistent storage
RUN mkdir -p /app/data/flows
RUN mkdir -p /app/data/settings

# Set working directory
WORKDIR /app

# Install required packages
RUN pip install langchain-astradb

# Set environment variables
ENV PORT=8080
ENV HOST=0.0.0.0
ENV LANGFLOW_MEMORY_LIMIT=3GB
ENV LANGFLOW_FLOWS_DIR=/app/data/flows
ENV LANGFLOW_SETTINGS_DIR=/app/data/settings
ENV LANGFLOW_LOG_LEVEL=DEBUG

EXPOSE ${PORT}

# Copy flow file
COPY flows/Langflowmvp.json /app/data/flows/

# Add healthcheck
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:${PORT}/ || exit 1

CMD ["langflow", "run", "--host", "0.0.0.0", "--port", "8080", "--log-level", "debug"]

