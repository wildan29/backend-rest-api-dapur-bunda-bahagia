# User API

## Register User API (DONE)

Endpoint : POST /api/users

Request Body :

```json
{
  "nama_lengkap": "wildan",
  "password": "apa hayo",
  "email": "wildan"
}
```

Response Body Success :

```json
{
  "data": {
    "message": "Account created successfully"
  }
}
```

Response Body Error :

```json
{
  "errors": "Email already registered"
}
```

## Login User API (DONE)

Request Body :

```json
{
  "email": "wildan",
  "password": "apa hayo"
}
```
