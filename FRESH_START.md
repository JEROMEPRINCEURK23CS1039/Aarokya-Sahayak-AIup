# 🆕 COMPLETE FRESH START - From Zero to Live Website

You deleted everything on Render. Let's rebuild from scratch!

**What you have:**
- ✅ MongoDB username & password
- ✅ Code on GitHub
- ✅ This guide

**Time needed:** 45 minutes

---

## 🎯 STEP-BY-STEP DEPLOYMENT

### PREREQUISITES CHECK

#### 1. Verify GitHub Repository
1. Open browser
2. Go to: https://github.com/JEROMEPRINCEURK23CS1039/Aarokya-Sahayak-AIup
3. Make sure you see all your code files
4. ✅ If yes, continue!

#### 2. Setup MongoDB Atlas
1. Go to: https://cloud.mongodb.com
2. Login with your credentials
3. Click **"Network Access"** (left sidebar under Security)
4. Click **"+ ADD IP ADDRESS"** button
5. Click **"ALLOW ACCESS FROM ANYWHERE"**
6. It will show: `0.0.0.0/0`
7. Click **"Confirm"**
8. Wait 1-2 minutes for it to activate
9. ✅ MongoDB is ready!

---

## 🔑 YOUR CREDENTIALS

Your MongoDB connection string:
```
mongodb+srv://jeromeprince_db_user:Fi1EwHtqAOnXr1D8@cluster0.ylkl4e9.mongodb.net/aarogya-sahayak?retryWrites=true&w=majority
```

Your JWT secrets (I generated secure ones for you):
```
JWT_SECRET:
b82ddcda623c772ec02b66c54644514e7111c99722662414359f1690dda2acef63f4e7db4dc0ef64327a14dda6b9e0a6a8c2f2c9882e3c38572de2839e284389

JWT_REFRESH_SECRET:
b0cccaafcdfcaac10ba100c53087d183d931ff7b5a9502fc42a6d63295f415bfff7e28b1f489285f213cf2858822b9cf07ae2839c661f7deb73aedbd2a99789b
```

---

## 🚀 PART 1: DEPLOY BACKEND (10 minutes)

### Step 1: Login to Render
1. Open: https://dashboard.render.com
2. Click **"Sign In"**
3. Login with your account
4. You should see empty dashboard (you deleted everything)

### Step 2: Create Backend Service
1. Click **"New +"** button (top right)
2. Select **"Web Service"**

### Step 3: Connect GitHub
1. You'll see "Create a new Web Service"
2. Under "Git Provider", look for your repo: **"Aarokya-Sahayak-AIup"**
3. Click **"Connect"** next to it
4. If you don't see it, click "Configure account" to authorize GitHub

### Step 4: Configure Backend

Fill in these fields EXACTLY as shown:

**Name:**
```
aarogya-backend
```

**Region:**
```
Oregon (US West)
```
(Or pick closest to you: Singapore, Frankfurt, etc.)

**Branch:**
```
main
```

**Root Directory:**
```
server
```

**Runtime:**
```
Node
```

**Build Command:**
```
npm ci --omit=dev
```

**Start Command:**
```
node server.js
```

### Step 5: Add Environment Variables

Scroll down and click **"Advanced"** button.

Now click **"Add Environment Variable"** for EACH of these:

**Variable 1:**
- Key: `MONGO_URI`
- Value: `mongodb+srv://jeromeprince_db_user:Fi1EwHtqAOnXr1D8@cluster0.ylkl4e9.mongodb.net/aarogya-sahayak?retryWrites=true&w=majority`

**Variable 2:**
- Key: `JWT_SECRET`
- Value: `b82ddcda623c772ec02b66c54644514e7111c99722662414359f1690dda2acef63f4e7db4dc0ef64327a14dda6b9e0a6a8c2f2c9882e3c38572de2839e284389`

**Variable 3:**
- Key: `JWT_REFRESH_SECRET`
- Value: `b0cccaafcdfcaac10ba100c53087d183d931ff7b5a9502fc42a6d63295f415bfff7e28b1f489285f213cf2858822b9cf07ae2839c661f7deb73aedbd2a99789b`

**Variable 4:**
- Key: `NODE_ENV`
- Value: `production`

**Variable 5:**
- Key: `PORT`
- Value: `5000`

**Variable 6:** (We'll update this later)
- Key: `CLIENT_URL`
- Value: `http://localhost:5173`

**Variable 7:** (We'll update this later)
- Key: `ML_SERVICE_URL`
- Value: `http://localhost:5001`

### Step 6: Deploy Backend
1. Scroll to bottom
2. Select **"Free"** plan
3. Click **"Create Web Service"**
4. Wait 3-5 minutes
5. Watch for: **"Your service is live 🎉"**

### Step 7: Save Your Backend URL
1. At the top, you'll see your URL
2. Example: `https://aarogya-backend-abc123.onrender.com`
3. **COPY THIS URL!** Write it down:

**MY BACKEND URL:**
```
https://aarogya-backend-sv4k.onrender.com
```

### Step 8: Test Backend
1. Open new browser tab
2. Go to: `YOUR-BACKEND-URL/api/health`
3. Should see:
```json
{
  "status": "ok",
  "mongodb": "connected"
}
```

✅ **PART 1 DONE! Backend is live!**

---

## 🤖 PART 2: DEPLOY ML SERVICE (10 minutes)

### Step 1: Create ML Service
1. Go back to dashboard (click "Dashboard" top left)
2. Click **"New +"**
3. Select **"Web Service"**

### Step 2: Connect Repository
1. Find **"Aarokya-Sahayak-AIup"**
2. Click **"Connect"**

### Step 3: Configure ML Service

**Name:**
```
aarogya-ml-service
```

**Region:**
```
Oregon (US West)
```
(Same as backend)

**Branch:**
```
main
```

**Root Directory:**
```
ml-service
```

**Runtime:**
```
Python 3
```

**Build Command:**
```
pip install -r requirements.txt
```

**Start Command:**
```
gunicorn -w 2 -b 0.0.0.0:$PORT app:app
```

### Step 4: Add Environment Variables

Click **"Advanced"**

**Variable 1:**
- Key: `FLASK_ENV`
- Value: `production`

**Variable 2:**
- Key: `PORT`
- Value: `5000`

### Step 5: Deploy ML Service
1. Select **"Free"** plan
2. Click **"Create Web Service"**
3. Wait 3-5 minutes
4. Watch for: **"Your service is live 🎉"**

### Step 6: Save ML Service URL
1. Copy the URL at top
2. Example: `https://aarogya-ml-service-xyz789.onrender.com`

**MY ML SERVICE URL:**
```
https://aarogya-ml-service.onrender.com
```

### Step 7: Test ML Service
1. Go to: `YOUR-ML-URL/health`
2. Should see success message

✅ **PART 2 DONE! ML Service is live!**

---

## 🎨 PART 3: DEPLOY FRONTEND (8 minutes)

### Step 1: Create Static Site
1. Go to dashboard
2. Click **"New +"**
3. Select **"Static Site"** (NOT Web Service!)

### Step 2: Connect Repository
1. Find **"Aarokya-Sahayak-AIup"**
2. Click **"Connect"**

### Step 3: Configure Frontend

**Name:**
```
aarokya-sahayak-frontend
```

**Branch:**
```
main
```

**Root Directory:**
```
client
```

**Build Command:**
```
npm install && npm run build
```

**Publish Directory:**
```
dist
```

### Step 4: Deploy Frontend
1. Select **"Free"** plan
2. Click **"Create Static Site"**
3. Wait 2-3 minutes
4. Watch for: **"Your site is live"**

### Step 5: Save Frontend URL
1. Copy URL at top
2. Example: `https://aarokya-sahayak-frontend-def456.onrender.com`

**MY FRONTEND URL:**
```
https://aarokya-sahayak-aiup.onrender.com
```

✅ **PART 3 DONE! Frontend is live!**

---

## 🔄 PART 4: CONNECT ALL SERVICES (5 minutes)

Now we need to link everything together!

### Step 1: Update Backend Environment Variables

#### A. Go to Backend Service
1. Dashboard → Click **"aarogya-backend"**
2. Click **"Environment"** (left sidebar)

#### B. Update CLIENT_URL
1. Find `CLIENT_URL`
2. Click **pencil icon** (Edit)
3. Change from `http://localhost:5173` to **YOUR FRONTEND URL** (from Part 3, Step 5)
4. Example: `https://aarokya-sahayak-frontend-def456.onrender.com`
5. Click **"Save"**

#### C. Update ML_SERVICE_URL
1. Find `ML_SERVICE_URL`
2. Click **pencil icon** (Edit)
3. Change to: **YOUR ML SERVICE URL** + `/api/ml/predict`
4. Example: `https://aarogya-ml-service-xyz789.onrender.com/api/ml/predict`
5. Click **"Save"**

#### D. Save Changes
1. Click **"Save Changes"** button at top
2. Confirm redeploy
3. Wait 2-3 minutes

✅ **Backend updated!**

### Step 2: Update Frontend Code (Already Done!)

Your frontend code already points to the backend!
The file `client/src/api/axios.ts` has:
```typescript
baseURL: 'https://aarogya-backend-mq0k.onrender.com/api/v1'
```

**But we need to update it with YOUR new backend URL!**

---

## 📝 PART 5: UPDATE FRONTEND API URL (CRITICAL!)

We need to update your code to use the NEW backend URL.

### In VS Code (on your computer):

1. Open file: `client/src/api/axios.ts`
2. Find the line:
```typescript
baseURL: 'https://aarogya-backend-mq0k.onrender.com/api/v1'
```
3. Change it to YOUR backend URL:
```typescript
baseURL: 'https://aarogya-backend-YOUR-URL.onrender.com/api/v1'
```
4. Save the file

### Push to GitHub:
```powershell
git add client/src/api/axios.ts
git commit -m "Update backend URL"
git push origin main
```

### Wait for Redeploy:
1. Go to your frontend service in Render
2. It will auto-deploy in 2-3 minutes
3. Watch logs for: "Your site is live"

✅ **Everything is connected!**

---

## ✅ PART 6: FINAL TESTING (5 minutes)

### Test 1: Backend Health
Go to: `https://YOUR-BACKEND-URL.onrender.com/api/health`

Should see:
```json
{
  "status": "ok",
  "mongodb": "connected"
}
```
✅ Backend working!

### Test 2: ML Service
Go to: `https://YOUR-ML-URL.onrender.com/health`
✅ ML Service working!

### Test 3: Frontend
Go to: `https://YOUR-FRONTEND-URL.onrender.com`
✅ Website loads!

### Test 4: Register User
1. On website, click **"Register"**
2. Fill in:
   - Name: Test User
   - Email: test@example.com
   - Password: Test123!
3. Click **"Sign Up"**
✅ Registration working!

### Test 5: Login
1. Click **"Login"**
2. Email: test@example.com
3. Password: Test123!
4. Click **"Login"**
✅ Login working!

---

## 🎉 CONGRATULATIONS! YOU'RE LIVE!

### Your Services:
- 🌐 **Frontend:** `https://aarokya-sahayak-frontend-__________.onrender.com`
- ⚙️ **Backend:** `https://aarogya-backend-__________.onrender.com`
- 🤖 **ML Service:** `https://aarogya-ml-service-__________.onrender.com`

---

## 📋 SUMMARY - What We Built

✅ **Backend Server** (Node.js + Express)
- User authentication
- API endpoints
- MongoDB connection
- Socket.IO for real-time features

✅ **ML Service** (Python + Flask)
- Disease prediction
- Health analysis
- ML model serving

✅ **Frontend** (React + TypeScript)
- User interface
- Registration/Login
- Dashboard
- Hospital finder

---

## 🐛 TROUBLESHOOTING

### Backend shows "mongodb: disconnected"
**Fix:**
1. MongoDB Atlas → Network Access
2. Make sure 0.0.0.0/0 is listed
3. If not, add it again

### CORS error in browser
**Fix:**
1. Backend → Environment
2. Verify `CLIENT_URL` = your exact frontend URL
3. No trailing slash!

### Can't register/login
**Fix:**
1. Press F12 in browser
2. Check Console for errors
3. Check Network tab for failed requests
4. Verify frontend is using correct backend URL

### Service is sleeping/slow
**Note:**
- Render free tier sleeps after 15 min inactivity
- First request takes 30-60 seconds to wake up
- This is normal for free tier

---

## 📞 NEXT STEPS

### 1. Update Frontend URL in Code
**IMPORTANT:** You must update `client/src/api/axios.ts` with your NEW backend URL!

Open VS Code and run:
```powershell
code "c:\Users\jancy\Desktop\3rd Ia web tech\client\src\api\axios.ts"
```

Change the baseURL to YOUR backend URL from Part 1, Step 7.

Then push to GitHub:
```powershell
git add .
git commit -m "Update backend URL to new Render deployment"
git push origin main
```

### 2. Save Your URLs
Write down all three URLs somewhere safe:
- Frontend URL
- Backend URL
- ML Service URL

### 3. Test Everything
Go through all the tests in Part 6!

---

## 🎯 CHECKLIST

- [ ] MongoDB Network Access allows 0.0.0.0/0
- [ ] Backend deployed on Render
- [ ] Backend health returns "mongodb: connected"
- [ ] ML Service deployed on Render
- [ ] ML Service health check works
- [ ] Frontend deployed on Render
- [ ] Frontend loads in browser
- [ ] Updated axios.ts with new backend URL
- [ ] Pushed changes to GitHub
- [ ] Frontend redeployed with new URL
- [ ] Can register new user
- [ ] Can login with user
- [ ] All features work

---

**START WITH PART 1 NOW!**

Tell me when you:
1. Finish Part 1 (Backend deployed)
2. Finish Part 2 (ML Service deployed)
3. Finish Part 3 (Frontend deployed)
4. Need help with Part 5 (updating code)

**I'm here to help every step of the way! 🚀**
