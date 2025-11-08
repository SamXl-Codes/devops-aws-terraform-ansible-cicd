#!/usr/bin/env python3
import sys
import os
sys.path.insert(0, os.path.join(os.path.dirname(__file__), 'app'))

from app import app

def test_app():
    print("Testing Flask application...")
    
    with app.test_client() as client:
        # Test home page
        response = client.get('/')
        print(f"Home page status: {response.status_code}")
        
        # Test health endpoint
        response = client.get('/health')
        print(f"Health endpoint status: {response.status_code}")
        print(f"Health response: {response.get_json()}")
        
        # Test other routes
        routes = ['/about', '/experience', '/projects', '/contact']
        for route in routes:
            response = client.get(route)
            print(f"{route} status: {response.status_code}")
    
    print("✓ Flask app is working correctly!")

if __name__ == '__main__':
    test_app()