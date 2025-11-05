from flask import Flask
app = Flask(__name__)

@app.get("/")
def home():
    return "Hello from Samuel's DevOps CA (AWS + Terraform + Ansible + Docker)!"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=80)
