// scripts/copy-cms.js
const fs = require("fs");
const path = require("path");

function copy(src, destDir, filename) {
  fs.mkdirSync(destDir, { recursive: true });
  const dest = path.join(destDir, filename);
  fs.copyFileSync(src, dest);
  console.log("Copied:", filename, "->", dest);
}

try {
  const cmsJs = require.resolve("@decapcms/decap-cms/dist/decap-cms.js");
  const cmsCss = require.resolve("@decapcms/decap-cms/dist/decap-cms.css");
  const destDir = path.join(process.cwd(), "public", "admin", "vendor");
  copy(cmsJs, destDir, "decap-cms.js");
  copy(cmsCss, destDir, "decap-cms.css");
  console.log("✅ Decap CMS assets copied to /public/admin/vendor");
} catch (e) {
  console.error("❌ Failed to copy Decap CMS files:", e);
  process.exit(1);
}
