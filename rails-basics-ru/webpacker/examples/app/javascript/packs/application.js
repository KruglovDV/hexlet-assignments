// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

window.Routes = Routes;
// Стили могут импортироваться в application.js
import "../styles/main.scss";

// import hello from 'javascript/hello';
require('javascript/hello');

Rails.start()
Turbolinks.start()
ActiveStorage.start()

// Статичные ассеты будут выведены в директорию внутри public/packs/media
// app/javascript/images
const images = require.context("../images", true)
const imagePath = name => images(name, true)
