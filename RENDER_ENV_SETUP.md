# Render Environment Variables Setup Guide

## Your Configuration Details

### MongoDB Atlas
- **Username**: `jeromeprince_db_user`
- **Password**: `Fi1EwHtqAOnXr1D8`
- **Connection String**: `mongodb+srv://jeromeprince_db_user:Fi1EwHtqAOnXr1D8@cluster0.ylkl4e9.mongodb.net/?appName=Cluster0`

### Services
- **Frontend**: https://aarokya-sahayak-aiup.onrender.com
- **Backend**: https://aarogya-backend-mq0k.onrender.com
- **ML Service**: https://aarogya-ml-service.onrender.com

---

## Backend Service Environment Variables

Go to: https://dashboard.render.com → **aarogya-backend** → **Environment**

Add/Update these environment variables:

### 1. MONGO_URI
```
mongodb+srv://jeromeprince_db_user:Fi1EwHtqAOnXr1D8@cluster0.ylkl4e9.mongodb.net/aarogya-sahayak?retryWrites=true&w=majority
```

### 2. JWT_SECRET
```
b82ddcda623c772ec02b66c54644514e7111c99722662414359f1690dda2acef63f4e7db4dc0ef64327a14dda6b9e0a6a8c2f2c9882e3c38572de2839e284389
```

### 3. JWT_REFRESH_SECRET
```
b0cccaafcdfcaac10ba100c53087d183d931ff7b5a9502fc42a6d63295f415bfff7e28b1f489285f213cf2858822b9cf07ae2839c661f7deb73aedbd2a99789b
```

### 4. CLIENT_URL
```
https://aarokya-sahayak-aiup.onrender.com
```

### 5. ML_SERVICE_URL
```
https://aarogya-ml-service.onrender.com/api/ml/predict
```

### 6. PORT
```
5000
```
*(Render usually sets this automatically)*

### 7. NODE_ENV
```
production
```

---

## ML Service Environment Variables

Go to: https://dashboard.render.com → **aarogya-ml-service** → **Environment**

These should already be set from render.yaml:

### 1. FLASK_ENV
```
production
```

### 2. AAROGYA_ML_MODELS_DIR
```
.
```

---

## Frontend Static Site Configuration

Go to: https://dashboard.render.com → **aarokya-sahayak-aiup** (frontend) → **Settings**

### Build Settings:
- **Build Command**: `npm install && npm run build`
- **Publish Directory**: `dist`

### Environment Variables:
Add these if needed:

#### VITE_API_URL
```
https://aarogya-backend-mq0k.onrender.com/api/v1
```

---

## Step-by-Step Setup Process

### 1. Backend Service
1. Go to https://dashboard.render.com
2. Click on **aarogya-backend-mq0k** service
3. Click **Environment** tab in left sidebar
4. For each environment variable above:
   - Click **"Add Environment Variable"** or **edit existing**
   - Copy and paste the **Key** and **Value**
   - Click **Save Changes**
5. Service will automatically redeploy

### 2. ML Service
1. Click on **aarogya-ml-service** service
2. Verify environment variables are set (should be automatic from render.yaml)
3. If not, add them manually

### 3. Frontend Service
1. Click on your frontend service
2. Go to **Environment** tab
3. Add `VITE_API_URL` if needed
4. Click **Save Changes**

---

## Verification Steps

### After Setting Up Environment Variables:

1. **Check Backend Logs**
   - Go to backend service → **Logs** tab
   - Look for: `MongoDB connected successfully`
   - Look for: `Server running on http://localhost:5000`

2. **Test Backend Health**
   - Open: https://aarogya-backend-mq0k.onrender.com/api/health
   - Should return JSON with `status: 'ok'` and `mongodb: 'connected'`

3. **Test ML Service**
   - Open: https://aarogya-ml-service.onrender.com/health
   - Should return success message

4. **Test Frontend**
   - Open: https://aarokya-sahayak-aiup.onrender.com
   - Try to register a new account
   - Try to log in

---

## Important Notes

### MongoDB Connection String Format:
The format includes the database name after the domain:
```
mongodb+srv://username:password@cluster.mongodb.net/DATABASE_NAME?options
```

Make sure `aarogya-sahayak` is the database name you want to use.

### CORS Configuration:
Your backend is configured to accept requests from your frontend URL. If you change the frontend URL, update `CLIENT_URL` in backend environment variables.

### Security:
- Never commit these values to Git
- Keep your MongoDB password and JWT secrets secure
- Consider using Render's "Secret File" feature for sensitive data

---

## Troubleshooting

### Sign-in/Sign-up Not Working:
1. Check browser console for CORS errors
2. Verify `CLIENT_URL` is set correctly in backend
3. Check backend logs for MongoDB connection status
4. Verify frontend is pointing to correct backend URL

### MongoDB Connection Issues:
1. Check if IP whitelist includes `0.0.0.0/0` (allow all) in MongoDB Atlas
2. Verify username and password are correct
3. Check MongoDB Atlas cluster is active

### ML Service Issues:
1. Check ML service logs
2. Verify model files are uploaded correctly
3. Test ML endpoint directly

---

## Quick Commands for Local Testing

If you want to test locally with these settings:

### Create .env file in server folder:
```bash
cd server
echo MONGO_URI=mongodb+srv://jeromeprince_db_user:Fi1EwHtqAOnXr1D8@cluster0.ylkl4e9.mongodb.net/aarogya-sahayak?retryWrites=true&w=majority > .env
echo JWT_SECRET=b82ddcda623c772ec02b66c54644514e7111c99722662414359f1690dda2acef63f4e7db4dc0ef64327a14dda6b9e0a6a8c2f2c9882e3c38572de2839e284389 >> .env
echo CLIENT_URL=http://localhost:5173 >> .env
echo ML_SERVICE_URL=https://aarogya-ml-service.onrender.com/api/ml/predict >> .env
```

**Note**: Don't commit the .env file to Git!

---

## Success Checklist

- [ ] Backend environment variables set in Render
- [ ] ML Service environment variables verified
- [ ] Frontend axios.ts updated with backend URL
- [ ] Backend shows "MongoDB connected successfully" in logs
- [ ] Backend health endpoint returns success
- [ ] ML service health endpoint returns success
- [ ] Frontend loads without errors
- [ ] User registration works
- [ ] User login works
- [ ] All features are accessible

---

## Need Help?

If issues persist:
1. Check Render service logs for all three services
2. Check browser developer console (F12) for errors
3. Verify all URLs are correct and services are deployed
4. Check MongoDB Atlas network access settings
