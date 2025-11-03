# 🚀 RENDER DEPLOYMENT - STEP BY STEP GUIDE

Follow these steps EXACTLY in order. Don't skip anything!

---

## ⚙️ PREREQUISITES (1 minute)

Before starting, make sure:
- ✅ Your code is on GitHub: https://github.com/JEROMEPRINCEURK23CS1039/Aarokya-Sahayak-AIup
- ✅ You have a Render account: https://render.com
- ✅ MongoDB Atlas allows all IPs (0.0.0.0/0)

If you haven't done MongoDB setup:
1. Go to https://cloud.mongodb.com
2. Network Access → Add IP Address → Allow Access from Anywhere (0.0.0.0/0)

---

## 📋 WHAT WE'LL DEPLOY

You'll deploy 3 services on Render:
1. **Backend** (Node.js server)
2. **ML Service** (Python Flask)
3. **Frontend** (React static site)

---

## 🎯 PART 1: DEPLOY BACKEND (10 minutes)

### Step 1: Login to Render
1. Open browser
2. Go to: **https://dashboard.render.com**
3. Click **"Sign In"** (top right corner)
4. Enter your email and password
5. Click **"Login"**
6. You should see your Render Dashboard

### Step 2: Create New Web Service
1. Look for **"New +"** button at the top right
2. Click **"New +"**
3. A dropdown menu appears
4. Click **"Web Service"**

### Step 3: Connect GitHub Repository
1. You'll see "Create a new Web Service" page
2. Look for section: "Git Provider"
3. If you see your repository **"Aarokya-Sahayak-AIup"** in the list:
   - Click **"Connect"** button next to it
4. If you DON'T see it:
   - Click **"Connect account"** or **"Configure account"**
   - Authorize Render to access your GitHub
   - Select the repository
   - Click **"Connect"**

### Step 4: Configure Backend Service

Now fill in these fields EXACTLY:

#### Name
```
aarogya-backend
```
Type this in the "Name" field

#### Region
Click the dropdown and select:
```
Oregon (US West)
```
(Or choose the region closest to you)

#### Branch
```
main
```

#### Root Directory
```
server
```
**IMPORTANT:** This tells Render where your backend code is

#### Runtime
Click dropdown and select:
```
Node
```

#### Build Command
```
npm ci --omit=dev
```
Copy and paste this EXACTLY

#### Start Command
```
node server.js
```

### Step 5: Add Environment Variables

Scroll down until you see **"Advanced"** button
1. Click **"Advanced"** button
2. A section expands showing "Environment Variables"
3. You'll see **"Add Environment Variable"** button

Now add each variable ONE BY ONE:

#### Variable 1: MONGO_URI
1. Click **"Add Environment Variable"**
2. In "Key" field, type: `MONGO_URI`
3. In "Value" field, paste:
```
mongodb+srv://jeromeprince_db_user:Fi1EwHtqAOnXr1D8@cluster0.ylkl4e9.mongodb.net/aarogya-sahayak?retryWrites=true&w=majority
```
4. Don't click anything yet, just move to next variable

#### Variable 2: JWT_SECRET
1. Click **"Add Environment Variable"** again
2. Key: `JWT_SECRET`
3. Value:
```
b82ddcda623c772ec02b66c54644514e7111c99722662414359f1690dda2acef63f4e7db4dc0ef64327a14dda6b9e0a6a8c2f2c9882e3c38572de2839e284389
```

#### Variable 3: JWT_REFRESH_SECRET
1. Click **"Add Environment Variable"**
2. Key: `JWT_REFRESH_SECRET`
3. Value:
```
b0cccaafcdfcaac10ba100c53087d183d931ff7b5a9502fc42a6d63295f415bfff7e28b1f489285f213cf2858822b9cf07ae2839c661f7deb73aedbd2a99789b
```

#### Variable 4: CLIENT_URL
1. Click **"Add Environment Variable"**
2. Key: `CLIENT_URL`
3. Value:
```
https://aarokya-sahayak-aiup.onrender.com
```
**NOTE:** This is your frontend URL (we'll get exact URL later if different)

#### Variable 5: ML_SERVICE_URL
1. Click **"Add Environment Variable"**
2. Key: `ML_SERVICE_URL`
3. Value:
```
https://aarogya-ml-service.onrender.com/api/ml/predict
```

#### Variable 6: NODE_ENV
1. Click **"Add Environment Variable"**
2. Key: `NODE_ENV`
3. Value:
```
production
```

#### Variable 7: PORT
1. Click **"Add Environment Variable"**
2. Key: `PORT`
3. Value:
```
5000
```

### Step 6: Select Plan
1. Scroll down to "Instance Type" section
2. You'll see plan options
3. Select **"Free"** (should be $0/month)

### Step 7: Create Web Service
1. Scroll to the bottom
2. Click the big blue **"Create Web Service"** button
3. Wait for the page to load

### Step 8: Wait for Deployment
1. You'll be taken to your service page
2. You'll see logs appearing on screen
3. Watch for these messages:
   - "Downloading cache..."
   - "Installing dependencies..."
   - "Build successful 🎉"
   - "Deploying..."
   - "MongoDB connected successfully"
   - **"Your service is live 🎉"**
4. This takes **3-5 minutes** - be patient!

### Step 9: Copy Backend URL
1. At the top of the page, look for your service URL
2. It will look like: `https://aarogya-backend-xyz.onrender.com`
3. **COPY THIS URL** and save it somewhere (notepad, text file)
4. You'll need it later!

### Step 10: Test Backend
1. Open a new browser tab
2. Paste your backend URL and add `/api/health` at the end
3. Example: `https://aarogya-backend-xyz.onrender.com/api/health`
4. Press Enter

**You should see:**
```json
{
  "status": "ok",
  "timestamp": "2025-11-03...",
  "mongodb": "connected"
}
```

✅ **If you see this, BACKEND IS WORKING!**
❌ **If not, check logs in Render dashboard for errors**

---

## 🤖 PART 2: DEPLOY ML SERVICE (10 minutes)

### Step 1: Go Back to Dashboard
1. Click **"Dashboard"** in the top left corner
2. You'll see your backend service listed

### Step 2: Create New Web Service
1. Click **"New +"** button (top right)
2. Select **"Web Service"**

### Step 3: Connect Same Repository
1. Find **"Aarokya-Sahayak-AIup"** in the list
2. Click **"Connect"**

### Step 4: Configure ML Service

Fill in EXACTLY:

#### Name
```
aarogya-ml-service
```

#### Region
```
Oregon (US West)
```
(Same region as backend)

#### Branch
```
main
```

#### Root Directory
```
ml-service
```
**IMPORTANT:** This is where your ML code is

#### Runtime
Select from dropdown:
```
Python 3
```

#### Python Version
If asked, select:
```
3.11
```

#### Build Command
```
pip install -r requirements.txt
```

#### Start Command
```
gunicorn -w 2 -b 0.0.0.0:$PORT app:app
```

### Step 5: Add Environment Variables

Click **"Advanced"**

#### Variable 1: FLASK_ENV
1. Click **"Add Environment Variable"**
2. Key: `FLASK_ENV`
3. Value: `production`

#### Variable 2: PORT
1. Click **"Add Environment Variable"**
2. Key: `PORT`
3. Value: `5000`

### Step 6: Select Plan & Deploy
1. Select **"Free"** plan
2. Click **"Create Web Service"**
3. Wait **3-5 minutes** for deployment
4. Look for: **"Your service is live 🎉"**

### Step 7: Copy ML Service URL
1. Copy the URL shown at top
2. Example: `https://aarogya-ml-service-xyz.onrender.com`
3. **SAVE THIS URL**

### Step 8: Test ML Service
1. Open new browser tab
2. Go to: `https://YOUR-ML-SERVICE-URL.onrender.com/health`
3. Should see success message

✅ **ML Service is WORKING!**

---

## 🎨 PART 3: DEPLOY FRONTEND (8 minutes)

### Step 1: Go Back to Dashboard
1. Click **"Dashboard"** (top left)

### Step 2: Create Static Site
1. Click **"New +"** button
2. Select **"Static Site"** (not Web Service!)

### Step 3: Connect Repository
1. Find **"Aarokya-Sahayak-AIup"**
2. Click **"Connect"**

### Step 4: Configure Frontend

Fill in:

#### Name
```
aarokya-sahayak-frontend
```

#### Branch
```
main
```

#### Root Directory
```
client
```
**IMPORTANT:** This is where your React code is

#### Build Command
```
npm install && npm run build
```

#### Publish Directory
```
dist
```
**IMPORTANT:** This is where Vite outputs build files

### Step 5: Add Environment Variables (Optional)

Click **"Advanced"**

#### Variable 1: VITE_API_URL (Optional)
1. Click **"Add Environment Variable"**
2. Key: `VITE_API_URL`
3. Value: Your backend URL from Part 1, Step 9
4. Example: `https://aarogya-backend-xyz.onrender.com/api/v1`

### Step 6: Select Plan & Deploy
1. Select **"Free"** plan
2. Click **"Create Static Site"**
3. Wait **2-3 minutes**
4. Look for: **"Your site is live"**

### Step 7: Copy Frontend URL
1. Copy the URL at the top
2. Example: `https://aarokya-sahayak-frontend.onrender.com`
3. **SAVE THIS URL - This is your website!**

---

## 🔄 PART 4: UPDATE BACKEND WITH CORRECT URLS (5 minutes)

Now we need to update backend with the ACTUAL URLs we got.

### Step 1: Go to Backend Service
1. Click **"Dashboard"**
2. Click on **"aarogya-backend"** service

### Step 2: Open Environment Settings
1. Look at left sidebar
2. Click **"Environment"** (has a key icon 🔑)

### Step 3: Update CLIENT_URL
1. Find `CLIENT_URL` in the list
2. Click the **pencil icon** (Edit) next to it
3. Replace the value with YOUR actual frontend URL from Part 3, Step 7
4. Example: `https://aarokya-sahayak-frontend-xyz.onrender.com`
5. Click **"Save"**

### Step 4: Update ML_SERVICE_URL (If needed)
1. Find `ML_SERVICE_URL`
2. Click **pencil icon** (Edit)
3. Replace with YOUR actual ML service URL from Part 2, Step 7
4. Should be: `https://YOUR-ML-URL.onrender.com/api/ml/predict`
5. Click **"Save"**

### Step 5: Save All Changes
1. Look for **"Save Changes"** button at the top
2. Click it
3. A popup appears: "This will redeploy your service"
4. Click **"Yes"** or **"Save"**

### Step 6: Wait for Redeploy
1. Service will redeploy automatically
2. Watch logs
3. Wait for: **"Your service is live 🎉"**
4. Takes **2-3 minutes**

---

## ✅ PART 5: TEST EVERYTHING (5 minutes)

### Test 1: Backend Health Check
1. Open browser
2. Go to: `https://YOUR-BACKEND-URL.onrender.com/api/health`
3. Should see:
```json
{
  "status": "ok",
  "mongodb": "connected"
}
```
✅ **Backend working!**

### Test 2: ML Service Health
1. Go to: `https://YOUR-ML-SERVICE-URL.onrender.com/health`
2. Should see success message
✅ **ML Service working!**

### Test 3: Frontend Homepage
1. Go to: `https://YOUR-FRONTEND-URL.onrender.com`
2. Website should load with no errors
✅ **Frontend working!**

### Test 4: User Registration
1. On your website, find **"Register"** or **"Sign Up"** button
2. Click it
3. Fill in:
   - **Name:** `Test User`
   - **Email:** `test@example.com`
   - **Password:** `Test123!`
4. Click **"Sign Up"** or **"Register"**
5. Should show success message or redirect you
✅ **Registration working!**

### Test 5: User Login
1. Click **"Login"** or **"Sign In"**
2. Enter:
   - **Email:** `test@example.com`
   - **Password:** `Test123!`
3. Click **"Login"**
4. Should login successfully and see dashboard
✅ **Login working!**

---

## 🎉 CONGRATULATIONS! YOU'RE DONE!

### Your Live Services:
- 🌐 **Frontend:** `https://your-frontend-url.onrender.com`
- ⚙️ **Backend:** `https://your-backend-url.onrender.com`
- 🤖 **ML Service:** `https://your-ml-service-url.onrender.com`

### What's Working:
- ✅ User Registration
- ✅ User Login
- ✅ MongoDB Database Connection
- ✅ ML Predictions
- ✅ Full-Stack Application

---

## 🐛 TROUBLESHOOTING

### Problem: Backend shows "mongodb: disconnected"

**Solution:**
1. Go to https://cloud.mongodb.com
2. Click **"Network Access"** (left sidebar)
3. Make sure **0.0.0.0/0** is in the list
4. If not, add it: Add IP Address → Allow Access from Anywhere

### Problem: CORS Error in Browser Console

**Solution:**
1. Go to backend service in Render
2. Environment tab
3. Check `CLIENT_URL` exactly matches your frontend URL
4. NO trailing slash!
5. Save and redeploy

### Problem: Can't Register/Login

**Solution:**
1. Press **F12** in browser
2. Click **"Console"** tab
3. Look for red errors
4. Check **"Network"** tab for failed requests
5. Check backend logs in Render

### Problem: Service Won't Deploy

**Solution:**
1. Check Render logs for specific error
2. Common issues:
   - Wrong root directory
   - Wrong build/start command
   - Missing environment variables
3. Fix the issue and redeploy

### Problem: "Service Unavailable" or 503 Error

**Solution:**
1. Render free tier services sleep after inactivity
2. First request takes 30-60 seconds to wake up
3. Wait and refresh
4. Subsequent requests will be fast

---

## 📝 QUICK REFERENCE

### Your Environment Variables (Backend):

```
MONGO_URI = mongodb+srv://jeromeprince_db_user:Fi1EwHtqAOnXr1D8@cluster0.ylkl4e9.mongodb.net/aarogya-sahayak?retryWrites=true&w=majority

JWT_SECRET = b82ddcda623c772ec02b66c54644514e7111c99722662414359f1690dda2acef63f4e7db4dc0ef64327a14dda6b9e0a6a8c2f2c9882e3c38572de2839e284389

JWT_REFRESH_SECRET = b0cccaafcdfcaac10ba100c53087d183d931ff7b5a9502fc42a6d63295f415bfff7e28b1f489285f213cf2858822b9cf07ae2839c661f7deb73aedbd2a99789b

CLIENT_URL = [YOUR FRONTEND URL]

ML_SERVICE_URL = [YOUR ML SERVICE URL]/api/ml/predict

NODE_ENV = production

PORT = 5000
```

---

## 📞 NEED HELP?

If you get stuck:
1. Tell me which PART you're on
2. Tell me which STEP you're on
3. Share any error messages
4. Share a screenshot if possible

**I'll help you fix it! 🚀**

---

## ⏱️ Time Breakdown

- Part 1 (Backend): 10 minutes
- Part 2 (ML Service): 10 minutes
- Part 3 (Frontend): 8 minutes
- Part 4 (Update URLs): 5 minutes
- Part 5 (Testing): 5 minutes

**Total: ~40 minutes from start to finish**

---

**START WITH PART 1 NOW!**

Tell me when you finish each part! 🎯
