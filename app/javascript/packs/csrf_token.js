// find csrf token
const tags = document.getElementsByTagName("meta");
let authenticity_token = ""
for (let i = 0; i < tags.length; i++) {
  if (tags[i].name === "csrf-token") {
    authenticity_token = tags[i].content;
    break;
  }
}

module.exports = {
  csrf_auth_token: authenticity_token
}
