# 🎯 Easy Plugin Development Setup

**For non-developers who just want to vibe and code!**

No `npm run build`, no terminal commands, no copying files. Just code and reload! ✨

**Works from anywhere** - doesn't matter where your repo is located!

---

## 🚀 One-Time Setup (5 minutes)

### **Step 1: Link Your Vault**

Run the setup script **once**:

```bash
cd /path/to/letta-obsidian
./setup-vault.sh
```

**What it does:**
- Asks for your Obsidian vault location
- Creates a symlink (your vault plugin → your dev repo)
- Saves the path so you never have to do this again

**Example:**
```
Enter your vault path: ~/Documents/MyVault
✅ Symlink created!
```

---

### **Step 2: Start Auto-Build**

Start the auto-builder:

```bash
./auto-dev.sh
```

**Leave this running!** It watches for changes and builds automatically.

---

## 💫 Daily Workflow (Super Easy!)

### **Every Time You Want to Code:**

1. **Start auto-builder** (if not running):
   ```bash
   cd /path/to/letta-obsidian
   ./auto-dev.sh
   ```

2. **Code with Claude Code**:
   - Tell Claude Code what you want
   - Claude writes/edits code
   - Auto-builder detects changes
   - Builds happen automatically

3. **See changes**:
   - Press `Cmd+R` in Obsidian
   - Changes appear instantly! 🎉

---

## 🎨 Example Session

**You:** "Add a welcome message to the chat"

**Claude Code:** *Edits main.ts*

**Auto-builder in terminal:**
```
✅ Detected change... Compiling... Done!
```

**You:** *Presses `Cmd+R` in Obsidian*

**Result:** Welcome message appears! ✨

---

## 📁 Works From Anywhere!

Whether your repo is:
- ✅ On Desktop: `/Users/you/Desktop/letta-obsidian`
- ✅ In Documents: `/Users/you/Documents/letta-obsidian`
- ✅ In Code folder: `/Users/you/Code/letta-obsidian`
- ✅ Anywhere else!

The setup script finds it automatically and links to your vault.

---

## 🔧 Moving Your Repo?

If you move the repo to a different location:

1. Run setup again:
   ```bash
   cd /new/location/letta-obsidian
   ./setup-vault.sh
   ```

2. It will update the symlink automatically!

---

## 📝 What Each File Does

### **setup-vault.sh**
- One-time setup script
- Asks for your vault location
- Creates symlink from vault → repo
- Saves config to `.vaultpath`

### **auto-dev.sh**
- Watches for code changes
- Automatically builds when you save
- Leave it running while coding

### **.vaultpath**
- Stores your vault location
- Git-ignored (won't be committed)
- Created by setup-vault.sh

---

## 💡 Pro Tips

### **Multiple Vaults?**
The setup script asks which vault you want to use. To switch:
```bash
./setup-vault.sh
# Enter different vault path
```

### **Repo on External Drive?**
Works fine! Just run setup from that location.

### **Using Claude Code?**
Tell Claude Code:
```
Run the setup script and link my vault:
./setup-vault.sh

Then start auto-dev:
./auto-dev.sh
```

---

## 🔍 Troubleshooting

### **"Vault not found"**
- Check your vault path is correct
- Try with full path (not ~)
- Example: `/Users/yourname/Documents/ObsidianVault`

### **"Permission denied"**
```bash
chmod +x setup-vault.sh
chmod +x auto-dev.sh
```

### **Auto-builder not working?**
- Make sure `./auto-dev.sh` is running
- Check there are no TypeScript errors
- Try stopping and restarting it

### **Changes not appearing?**
- Make sure you reloaded Obsidian (Cmd+R)
- Check auto-builder shows "Done!"
- Verify symlink exists: `ls -la [vault]/.obsidian/plugins/letta`

---

## 🎉 That's It!

Your workflow is now:
1. **Tell Claude Code what to build**
2. **Claude writes the code**
3. **Auto-builder builds automatically**
4. **You reload Obsidian**
5. **Profit!** ✨

No `npm run build`, no copying, no manual steps. Just pure vibes! 🚀

---

## 🆘 Quick Commands

**One-time setup:**
```bash
cd /path/to/letta-obsidian
./setup-vault.sh
```

**Start auto-builder:**
```bash
cd /path/to/letta-obsidian
./auto-dev.sh
```

**Reload Obsidian:**
```
Cmd+R (or Ctrl+R on Windows)
```

**Stop auto-builder:**
```
Ctrl+C in the terminal
```

---

**Pro tip:** After setup, just keep `./auto-dev.sh` running in a terminal tab. Code all you want, reload Obsidian to see changes! 🎊
