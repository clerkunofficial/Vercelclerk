# ClerkUnofficial: setup guide (100% free, no AI)

Do this once on a laptop or desktop browser (about 15 minutes). A phone works for daily use afterwards.

## What you are making
- The app lives on Vercel (free), at an address like `clerkunofficial.vercel.app`.
- Your data and scanned files live in Supabase (free).
- The files are kept on GitHub (free).
- No payment card is needed for any of these three, as far as I know.

---

## Step 1: Supabase (database and file storage)
1. Go to supabase.com and sign up. Click **New project**.
2. Name it `clerkunofficial`. Set a database password and save it. Pick the region closest to India (Mumbai if shown). Click **Create**. Wait about 2 minutes.
3. In the left menu open **SQL Editor** and click **New query**.
4. Open the file `setup.sql` from this folder, copy everything, paste it, and click **Run**. It should say "Success". Run it only once.
5. Open **Authentication**, then **Sign In / Providers**, then **Email**. Turn **Confirm email** OFF and save. (Menu names can differ slightly.)
6. Open **Project Settings**, then **API** (or **API Keys**). Copy two things into a notepad:
   - **Project URL** (looks like `https://abcd.supabase.co`)
   - The public key: the **anon** key, or the **publishable** key (starts with `sb_publishable_`). Do NOT copy the secret or service_role key.

## Step 2: GitHub (holds the files)
1. Go to github.com and sign up. Click **New repository**. Name it `clerkunofficial`, choose **Private**, click **Create repository**.
2. Click **uploading an existing file**.
3. Unzip the project on your computer. Drag these into the GitHub page: the `api` folder, `index.html`, `setup.sql`, `SETUP-GUIDE.md`.
4. Click **Commit changes**.

## Step 3: Vercel (puts the app online)
1. Go to vercel.com and choose **Sign up with GitHub**. Pick the free Hobby plan.
2. Click **Add New**, then **Project**. Find `clerkunofficial` and click **Import**.
3. Leave **Framework Preset** as **Other**. Leave build settings empty.
4. Open **Environment Variables** and add these two (name on the left, value on the right):
   - `SUPABASE_URL` = your Project URL
   - `SUPABASE_ANON_KEY` = your public key
5. (Optional) Change the **Project Name** to `clerkunofficial`. Your address will be `clerkunofficial.vercel.app` if that name is free. If it is taken, use whatever Vercel gives you.
6. Click **Deploy**. After a minute you get your link.

## Step 4: First sign-in
1. Open your link. Type your email and a password. Click **Create account**.
2. You are in. Go to **Settings** and rename the 42 villages (use "Paste many names at once").

## Step 5: Lock the door
In Supabase: **Authentication**, **Sign In / Providers**, turn OFF **Allow new users to sign up**. Now nobody else can make an account, and your data is private to your login.

## Step 6: Put it on your phone
Open the link in your phone browser. On iPhone: Share, then **Add to Home Screen**. On Android: menu, then **Add to Home screen**.

---

## Changing things later
**No code needed (inside the app):**
- Fields in any section: tap **Edit fields** (rename, add, remove, reorder, change type, set choice lists)
- New sections: tap **+ New section** in Personal, Office or Links
- Village names, document types, search engines, app name: **Settings**

**Needs a code change (ask Claude):** new tabs, new screens, new calculations.
To apply a change: open the file in GitHub, click the pencil icon, paste the new content, click **Commit changes**. Vercel updates the live app in about a minute.

## If something goes wrong
- "Setup is not finished": an environment variable is missing or misspelled. In Vercel open Settings, Environment Variables, fix it, then Deployments, the three dots, **Redeploy**.
- "The database is not ready": run `setup.sql` in Supabase (Step 1.4).
- Free Supabase projects pause after about a week with no use, as far as I know. Open the app at least once a week. If it pauses, restore it from the Supabase dashboard.
- Free storage is 1 GB. Photos are compressed on upload to keep files small.

## Limits to know
- Sheet tools work on one sheet at a time and turn formulas into plain values. Everything runs in your browser.
- Print queue prints images together. PDFs open in their own tabs to print.
- The app needs internet. There is no offline mode.
- Backup downloads entries and settings, not the scanned files. Keep originals elsewhere too.
