# Omnitool Command Test Suite

**Version**: 2.0.0
**Date**: 2025-12-29
**Status**: Ready for Testing

---

## 📋 Setup Checklist

- [ ] Omnitool branch merged successfully ✅
- [ ] npm run build completes without errors ✅
- [ ] Plugin loads in Obsidian
- [ ] Letta agent is connected
- [ ] All approval toggles are ON in settings

---

## 🧪 Command Tests

### 1. VIEW - Read File Contents

**Test Command**: "Show me the contents of my daily note"

- [ ] Approval modal appears with file path
- [ ] Preview shows file excerpt
- [ ] Approve → Agent receives full content
- [ ] Deny → Operation cancelled, agent notified
- [ ] Agent can use content in follow-up responses

**Expected Result**: Agent displays or summarizes file content

---

### 2. CREATE - Make New Files

**Test Command**: "Create a note called 'Omnitool Test' with a checklist of your capabilities"

- [ ] Modal shows: file path, destination folder, full content
- [ ] Content preview is readable and correct
- [ ] Approve → File created in vault
- [ ] Verify: File exists at correct location
- [ ] Content matches agent's proposal
- [ ] File appears in Obsidian file explorer

**Expected Result**: New file with proposed content

---

### 3. STR_REPLACE - Edit Existing Text

**Test Command**: "In my TODO file, replace 'TODO' with '✓ DONE'"

- [ ] Modal shows: file path, old string, new string, match count
- [ ] Preview highlights changes (before/after)
- [ ] Approve → Replacement performed
- [ ] Verify: Text changed correctly
- [ ] Only matched instances were replaced
- [ ] File structure preserved

**Expected Result**: Specific text replacements made

---

### 4. INSERT - Add Text at Position

**Test Command**: "Add a new section '## Ideas' at the top of my project note"

- [ ] Modal shows: file path, line number, text to insert
- [ ] Preview shows insertion point
- [ ] Approve → Text inserted
- [ ] Verify: Formatting preserved
- [ ] Content at correct position
- [ ] No unintended deletions

**Expected Result**: Text inserted at specified line

---

### 5. DELETE - Remove Files

**Test Command**: "Delete my old test note from last week"

- [ ] Modal shows: file path, warning icon, file preview
- [ ] Confirm deletion with extra "Are you sure?" step
- [ ] Warning clearly indicates destructive action
- [ ] Approve → File moved to trash (not permanently deleted)
- [ ] Verify: File in trash
- [ ] Can be recovered if needed

**Expected Result**: File safely deleted (to trash)

---

### 6. ATTACH - Add to Agent Memory

**Test Command**: "Attach my project context note to your memory"

- [ ] Modal shows: block label, file path, content preview
- [ ] Shows memory impact (size/character count)
- [ ] Approve → Block created/updated in agent
- [ ] Verify: Block visible in memory view
- [ ] Agent uses info in subsequent responses
- [ ] Memory persists across sessions

**Expected Result**: File content in agent memory

---

### 7. DETACH - Remove from Memory

**Test Command**: "Detach the old project block from your memory"

- [ ] Modal shows: block to detach, current content
- [ ] Confirmation required
- [ ] Approve → Block removed from agent
- [ ] Verify: Block gone from memory view
- [ ] Block still exists (not deleted, just detached)
- [ ] Agent no longer references content

**Expected Result**: File detached, agent forgets content

---

### 8. SEARCH - Find in Vault

**Test Command**: "Search for all notes mentioning 'AI agent'"

- [ ] Modal shows: search query, scope (all files)
- [ ] Preview shows estimated match count
- [ ] Approve → Search executes
- [ ] Agent receives: file paths, match snippets
- [ ] Verify: Results accurate and relevant
- [ ] Agent can list or summarize findings

**Expected Result**: List of matching files with context

---

### 9. LIST - Browse Directories

**Test Command**: "What files are in my Projects folder?"

- [ ] Modal shows: directory path
- [ ] Approve → Directory listing returned
- [ ] Agent receives: file names, types, metadata
- [ ] Verify: Complete file list
- [ ] Correct folder targeted
- [ ] Agent can describe vault structure

**Expected Result**: Directory contents listed

---

## 🔥 Edge Cases

### Error Handling
- [ ] Deny approval → Agent acknowledges gracefully
- [ ] Invalid file path → Friendly error message shown
- [ ] File doesn't exist → Clear error, agent adapts
- [ ] Permission issues → Helpful error message

### Performance
- [ ] Large file (>1MB) view → Loads reasonably fast (<5s)
- [ ] Search across 1000+ notes → Completes in <10 seconds
- [ ] Batch str_replace (20+ files) → Progress indicator shown
- [ ] Create multiple files → No race conditions

### Security
- [ ] Cannot access files outside vault
- [ ] Cannot execute system commands
- [ ] Malicious paths (../../etc/passwd) rejected
- [ ] XSS attempts in content sanitized

### Multiple Operations
- [ ] Rapid consecutive commands → Queue handled properly
- [ ] Command while another pending → Both work correctly
- [ ] Cancel mid-operation → Clean cancellation

### Approval Settings
- [ ] Disabled approval toggle → Command auto-executes
- [ ] Different approval per command → Respected correctly
- [ ] Offline/disconnected → Graceful failure with retry option

---

## 📊 Test Results Summary

**Date Tested**: _______________
**Tester**: _______________

| Command | Passed | Failed | Notes |
|---------|--------|--------|-------|
| view | ⬜ | ⬜ | |
| create | ⬜ | ⬜ | |
| str_replace | ⬜ | ⬜ | |
| insert | ⬜ | ⬜ | |
| delete | ⬜ | ⬜ | |
| attach | ⬜ | ⬜ | |
| detach | ⬜ | ⬜ | |
| search | ⬜ | ⬜ | |
| list | ⬜ | ⬜ | |

**Edge Cases Tested**: _____ / 20
**Overall Status**: ⬜ Pass | ⬜ Fail | ⬜ Needs Work

---

## 🐛 Issues Found

### Critical (Blocks usage)
-

### Major (Significant impact)
-

### Minor (Small issues)
-

### Suggestions
-

---

## ✅ Sign-off

**Tester Signature**: _______________
**Date**: _______________
**Ready for Production**: ⬜ Yes | ⬜ No | ⬜ With caveats

**Notes**:
