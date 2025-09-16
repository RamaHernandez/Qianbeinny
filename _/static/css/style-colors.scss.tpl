{#/*============================================================================
style.scss.tpl

    -This file contains all the theme styles related to settings defined by user from config/settings.txt
    -Rest of styling can be found in:
        --static/css/style-async.css.tpl --> For non critical styles witch will be loaded asynchronously
        --static/css/style-critical.tpl --> For critical CSS rendered inline before the rest of the site

==============================================================================*/#}

{# /*============================================================================
  Table of Contents
  #Colors and fonts
    // Colors
    // Font families
    // SVG Icons
    // Texts
    // Backgrounds 
  #Components
    // Margin and Padding
    // Mixins
    // Animations
    // Wrappers
    // Placeholders
    // Dividers    
    // Headings
    // Buttons
    // Links
    // Chips
    // Progress bar 
    // Modals
    // Forms
    // Alerts and Notifications
    // Tooltip
    // Images
    // Tables
    // Tabs
    // Cards
    // Sliders
  #Home page
    // Home banners
    // Brands
    // Video
    // Instafeed
    // Newsletter
  #Product grid
    // Category controls
    // Grid item
    // Labels
  #Product detail
    // Image
    // Form and info
  #Cart
  #Header and nav
    // Header
    // Utilities
    // Search
    // Nav
  #Footer
    // Copyright
  #Media queries
    // Min width 768px
    //// Components
    //// Product grid

==============================================================================*/ #}

{#/*============================================================================
  #Colors and fonts
==============================================================================*/#}
	
{# /* // Colors */ #}

$accent-color: {{ settings.accent_color }};

$main-foreground: {{ settings.text_color }};
$main-background: {{ settings.background_color }};

{% if settings.adbar_colors %}
  $adbar-background: {{ settings.adbar_background_color }};
  $adbar-foreground: {{ settings.adbar_foreground_color }};
{% else %}
  $adbar-background: {{ settings.background_color }};
  $adbar-foreground: {{ settings.text_color }};
{% endif %}

{% if settings.header_colors %}
  $header-background: {{ settings.header_background_color }};
  $header-foreground: {{ settings.header_foreground_color }};
  $header-border: {{ settings.header_foreground_color }};
{% else %}
  $header-background: {{ settings.background_color }};
  $header-foreground: {{ settings.text_color }};
  $header-border: {{ settings.border_color }};
{% endif %}

{% if settings.head_transparent_contrast_options %}
  $header-transparent-foreground: {{ settings.header_transparent_foreground_color }};
{% endif %}

{% if settings.footer_colors %}
  $footer-background: {{ settings.footer_background_color }};
  $footer-foreground: {{ settings.footer_foreground_color }};
  $footer-border: {{ settings.footer_foreground_color }};
{% else %}
  $footer-background: {{ settings.background_color }};
  $footer-foreground: {{ settings.text_color }};
  $footer-border: {{ settings.border_color }};
{% endif %}

$button-background: {{ settings.button_background_color }};
$button-foreground: {{ settings.button_foreground_color }};

$label-background: {{ settings.label_background_color }};
$label-foreground: {{ settings.label_foreground_color }};

$border-color: {{ settings.border_color }};

{% if settings.brands_colors %}
  $brands-background: {{ settings.brands_background_color }};
  $brands-foreground: {{ settings.brands_foreground_color }};
{% endif %}

{% if settings.testimonials_colors %}
  $testimonials-background: {{ settings.testimonials_background_color }};
  $testimonials-foreground: {{ settings.testimonials_foreground_color }};
{% endif %}

{% if settings.home_news_colors %}
  $newsletter-background: {{ settings.home_news_background_color }};
  $newsletter-foreground: {{ settings.home_news_foreground_color }};
{% endif %}

{% if settings.welcome_colors %}
  $welcome-background: {{ settings.welcome_background_color }};
  $welcome-foreground: {{ settings.welcome_foreground_color }};
{% endif %}

{% if settings.institutional_colors %}
  $institutional-background: {{ settings.institutional_background_color }};
  $institutional-foreground: {{ settings.institutional_foreground_color }};
{% endif %}

$video-color: {{ settings.video_color }};

{# /* // Font families */ #}

$heading-font: {{ settings.font_headings | raw }};
$body-font: {{ settings.font_rest | raw }};

{# /* // SVG Icons */ #}

.svg-icon-text{
  fill: $main-foreground;
}

.svg-icon-accent{
  fill: $accent-color;
}

.svg-icon-invert{
  fill: $main-background;
}

{# /* // Texts */ #}

.text-secondary {
  color: $main-background;
}

.text-accent,
.product-installments.installment-no-interest {
  color: $accent-color!important;
}

.bg-primary{
  background-color: $accent-color!important;
  color: $main-background!important;
  a{
    color: $main-background!important;
  }
}

{# /* // Backgrounds */ #}

.background-main{
  background-color: $main-background;
}

{#/*============================================================================
  #Components
==============================================================================*/#}

{# /* // Margin and Padding */ #}

%section-margin {
  margin-bottom: 70px;
}
%element-margin {
  margin-bottom: 20px;
}
%element-margin-half {
  margin-bottom: 10px;
}

{# /* // Mixins */ #}

@mixin text-decoration-none(){
  text-decoration: none;
  outline: 0;
  &:hover,
  &:focus{
    text-decoration: none;
    outline: 0;
  }
}

@mixin no-wrap(){
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	font-weight: normal;
}

@mixin drop-shadow(){
	-moz-box-shadow: 0 0 3px #ccc;
	-webkit-box-shadow: 0 0 3px #ccc;
	box-shadow: 0 0 3px #ccc;
}

{# This mixin adds browser prefixes to a CSS property #}

@mixin prefix($property, $value, $prefixes: ()) {
	@each $prefix in $prefixes {
    	#{'-' + $prefix + '-' + $property}: $value;
	}
   	#{$property}: $value;
}

%border-radius {
  border-radius: 3px;
}

%border-radius-medium {
  border-radius: 20px;
}

%border-radius-small {
  border-radius: 10px;
}

{# /* // Animations */ #}

%simplefade {
  transition: all 0.5s ease;
}

{# /* // Functions */ #}

@function set-foreground-color($bg-color, $foreground-color) {
  @if (lightness($bg-color) > 50) {
    @return $foreground-color; // Lighter backgorund, return dark color
  } @else {
    @return lighten($foreground-color, 15%); // Darker background, return light color
  }
}

@function set-subnav-color($nav-color) {
  @if (lightness($nav-color) > 25) {
    @return rgba(0,0,0,0.18); // Lighter backgorund, return dark color
  } @else {
    @return rgba(255,255,255,0.1); // Darker background, return light color
  }
}

@function set-background-color($bg-color) {
  @if (lightness($bg-color) > 30) {
    @return darken($bg-color, 5%); // Lighter primary, return dark color
  } @else {
    @return lighten($bg-color, 5%); // Darker primary, return light color
  }
}

{# /* // Wrappers */ #}

%body-font {
  font-size: 14px;
}

%small-font {
  font-size: 12px;
}

body{
  color: $main-foreground;
  font-family: $body-font;
  background-color:$main-background;
  @extend %body-font;
}

.box{
  float: left;
  width: 100%;
  margin-bottom: 20px;
  padding:8px;
  border: var(--border-solid) $border-color;
}

{# /* // Placeholders */ #}

.placeholder-color{
  background-color:rgba($main-foreground, 0.2);
}
.placeholder-shine,
.placeholder-fade{
  background-color:rgba($main-foreground, 0.2);
}

.placeholder-shine-invert {
  background-color:rgba($main-background, 0.5);
}

.placeholder-overlay {
    background-color:rgba($main-foreground, 0.3);
    opacity: 0;
    &:hover,
    &:active,
    &:focus {
        opacity: 1;
    }
}

.placeholder-info {
  color: $main-foreground;
  fill: $main-foreground;
  background-color: $main-background;
  .placeholder-button {
    color: $main-background;
    background-color: $main-foreground;
    opacity: 1;
    &:hover {
      opacity: .8;
    }
  }
}

.spinner::before {
  background-color: $main-foreground;
}


{# /* // Dividers */ #}

.divider{
  margin-top: 20px;
  margin-bottom: 20px;
  clear: both;
  border-bottom: var(--border-solid) rgba($border-color, .1);
}

.top-line {
  border-top: var(--border-solid) $border-color;
}

.top-dashed-line {
  border-top: var(--border-dashed) $border-color;
}

.top-no-line {
  border-top: none !important;
}

.bottom-line {
  border-bottom: var(--border-solid) $border-color;
}

.bottom-dashed-line {
  border-bottom: var(--border-dashed) $border-color;
}

.bottom-no-line {
  border-bottom: none !important;
}

.right-line {
  border-right: var(--border-solid) $border-color;
}

.right-transparent-line {
  border-color: transparent;
}

.right-no-line {
  border-right: none;
}

.left-line {
  border-left: var(--border-solid) $border-color;
}

{# /* Headings */ #}

.page-header {
  h1, .h1{
    margin-bottom: 0;
  }
}

.category-header {
  @extend %element-margin;
  h1, .h1{
    margin-bottom: 0;
  }
}

.h1-huge,
h1,.h1,
h2,.h2,
h3,.h3,
h4,.h4,
h5,.h5,
h6,.h6{
  margin-top: 0;
  font-family: $heading-font;
  {% if settings.headings_bold %}
    font-weight: bold;
  {% else %}
    font-weight: normal;
  {% endif %}
}

{# /* // Buttons */ #}

.btn{
  margin: 0;
  text-decoration: none;
  text-align: center;
  border: 0;
  border-radius: 0;
  cursor: pointer;
  font-size: var(--font-small);
  font-weight: 400;
  line-height: 18px;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  white-space: normal;
  background: none;
  @include prefix(transition, all 0.4s ease, webkit ms moz o);
  &:hover,
  &:focus{
    outline: 0;
    opacity: 0.8;
  }
  &[disabled],
  &.disabled,
  &[disabled]:hover,
  &.disabled:hover,{
    opacity: 0.8;
    cursor: not-allowed;
    outline: 0;
  }
  &-default{
    display: block;
    padding: 15px 25px;
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    color: $main-foreground;
    fill: $main-foreground;
    background-color: $main-background;
    border: var(--border-solid) rgba($main-foreground, .3);
    @include prefix(transition, all 0.4s ease, webkit ms moz o);
  }
  &-primary{
    padding: 10px 15px;
    background-color: $button-background;
    color: $button-foreground;
    fill: $button-foreground;
    &:hover,
    &:focus{
      color: $button-foreground;
    }
    &[disabled],
    &.disabled,
    &[disabled]:hover,
    &.disabled:hover,{
      background-color: $button-background;
      color: $button-foreground;
      fill: $button-foreground;
    }
    &.btn-square.chevron:before {
      content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" fill="{{ settings.button_foreground_color |replace("#","%23") }}"><path d="M210.72,256,15,60.25l18.11-18.1L246.93,256,33.08,469.85,15,451.75Z"/></svg>');
    } 
  }
  &-secondary{
    padding: 9px 15px;
    color: $button-background;
    fill: $button-background;
    border: var(--border-solid) $button-background;
    &:hover{
      color: $button-background;
    }
    &.invert{
      color: $main-background;
      border: var(--border-solid) $main-background;
      &:hover{
        color: $main-background;
        opacity: 0.8;
      }
    }
  }
  &.btn-icon.chevron:before {
    content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" fill="{{ settings.button_foreground_color |replace("#","%23") }}"><path d="M17.525 36.465l-7.071 7.07c-4.686 4.686-4.686 12.284 0 16.971L205.947 256 10.454 451.494c-4.686 4.686-4.686 12.284 0 16.971l7.071 7.07c4.686 4.686 12.284 4.686 16.97 0l211.051-211.05c4.686-4.686 4.686-12.284 0-16.971L34.495 36.465c-4.686-4.687-12.284-4.687-16.97 0z"/></svg>');
  }
  &-block{
    width: 100%;
  }
  &-big {
    padding: 15px;
    text-transform: uppercase;
    letter-spacing: 1px;
  }
  &-medium{
    padding: 10px 15px;
    font-size: 14px;
  }
  &-small{
    display: inline-block;
    padding: 8px 10px;
    font-size: 12px;
    line-height: 14px;
  }
  &-line{
    border-top: var(--border-solid) $border-color;
    border-bottom: var(--border-solid) $border-color;
    &.btn-big {
      padding: 14px 15px;
    }
  }
  &-append {
    position: absolute;
    top: 0;
    right: 0;
    z-index: 9;
    width: 42px;
    height: 42px;
    border-radius: 0;
    border-left: var(--border-solid) rgba($main-foreground, .3);
    text-indent: -99999px;
    .btn-icon {
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translateX(-50%) translateY(-50%);
      width: 10px;
      font-size: 18px;
      &.icon-spin {
        top: 2px;
        left: 15px;
      }
    }
  }
  &-variant{
    float: left;
    font-size: 14px;
    line-height: 48px;
    min-width: 48px;
    min-height: 48px;
    padding: 0 5px;
    border-right: var(--border-solid) rgba($border-color, .8);
    border-bottom: var(--border-solid) rgba($border-color, .8);
    color: rgba($main-foreground, .8);
    vertical-align: top;
    &-content{
      display: block;
      min-height: 28px;
      margin: 10px;
      line-height: 28px;
    }
    &.selected {
      color: $main-foreground;
      border-color: $border-color;
      background: rgba($main-foreground, .1);
    }
  }
  &-facebook{
    color: #1977f2;
    border: none;
    border-bottom: var(--border-solid) #1977f2;
    .svg-fb-icon {
      position: relative;
      bottom: 1px;
      height: 16px;
      margin-right: 5px;
      vertical-align: middle;
      fill: #1977f2;
    }
    &:hover {
      background: #1977f2;
      color: #fff;
      .svg-fb-icon {
        fill: #fff;
      }
    }
  }
}

.btn-icon {
  position: relative;
  width: 38px;
  height: 38px;
  font-size: 0;
  line-height: 20px;
  &:before {
    position: absolute;
    top: 15px;
    left: 20px;
    width: 20px;
    height: 20px;
  }
}

button{
  cursor: pointer;
  &:focus{
    outline: 0;
    opacity: 0.8;
  }
}

{# /* // Links */ #}

a {
  color: $main-foreground;
  @include prefix(transition, all 0.4s ease, webkit ms moz o);
  &:hover,
  &:focus{
    color: rgba($main-foreground, .5);
  }
  &.disabled {
    opacity: 0.5;
    cursor: not-allowed;
  }
}

.link-contrast {
  color: $main-background;
  &:hover,
  &:focus{
    color: rgba($main-background, .8);
  }
}

.btn-link{
  color: $main-foreground;
  fill: $main-foreground;
  cursor: pointer;
  text-decoration: underline;
  font-size: 14px;
  &.invert{
    color: $main-background;
    fill: $main-background;
    &:hover,
    &:focus{
      color: $main-background;
      fill: $main-background;
      opacity: 0.5;
    }
  }
  &-primary{
    color: $button-background;
    fill: $button-background;
    &:hover,
    &:focus{
      color: $button-background;
      fill: $button-background;
      opacity: 0.5;
    }
  }
  &.no-underline {
    text-decoration: none;
  }
}

{# /* // Accordions */ #}

.accordion{
  border-top: var(--border-solid) rgba($border-color, .1);
  &:last-child {
    border-bottom: var(--border-solid) rgba($border-color, .1);
  }
}

{# /* // Chips */ #}

.chip{
  color: $main-foreground;
  fill: $main-foreground;
  background-color: $main-background;
  border: none;
  border-right: var(--border-solid) $border-color;
  border-bottom: var(--border-solid) $border-color;
}

{# /* // Progress bar */ #}

.bar-progress {
  background: rgba($main-foreground, 0.1);
  border-bottom: var(--border-solid) $border-color;
  &-active {
    background: $accent-color;
    border-right: var(--border-solid) $border-color;
  }
}

{# /* // Modals */ #}

.modal{
  color: $main-foreground;
  fill: $main-foreground;
  background-color:$main-background;
  &-header{
    border-bottom: var(--border-solid) $border-color;
    @include prefix(transition, all 0.4s ease, webkit ms moz o);
    &:hover,
    &:focus{
      opacity: .8;
    }
    &-no-title {
      background-color: $main-background;
    }
  }
  .modal-close {
    border-left: var(--border-solid) $border-color;
  }
  &-shadow{
    box-shadow: 0 0 8px 4px rgba($main-foreground, .1);
  }
  &-center {
    border: var(--border-solid) $border-color;
  }
  .modal-footer {
    border-top: var(--border-solid) $border-color;
  }
  &-nav-search .search-input {
    border-bottom: var(--border-solid) $border-color;
    &:hover,
    &:focus,
    &:active {
      border-color: $border-color;
    }
  }
  &-overlay {
    background-color: rgba($main-background, .9);
  }
}

{# /* // Forms */ #}

input,
textarea {
  font-family: $body-font;
}

.form-label-divider {
  border-bottom: var(--border-solid) rgba($border-color, .1);
}

.form-control::-webkit-input-placeholder { 
  color: rgba($main-foreground, .3);
}
.form-control:-moz-placeholder {
  color: rgba($main-foreground, .3);
}
.form-control::-moz-placeholder {
  color: rgba($main-foreground, .3);
}
.form-control:-ms-input-placeholder {
  color: rgba($main-foreground, .3);
}

.form-control,
.form-select,
.form-quantity{
  display: block;
  width: 100%;
  margin: 0;
  padding: 15px;
  font-size: 14px;
  font-family: $body-font;
  line-height: 16px;
  border: var(--border-solid) $border-color;
  border-right: none;
  border-left: none;
  border-radius: 0;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  color: $main-foreground;
  fill: $main-foreground;
  background-color: $main-background;
  @include prefix(transition, all 0.4s ease, webkit ms moz o);
  &:hover{
    border-color: rgba($border-color, .6);
    & + .form-select-icon{
      fill: $main-foreground;
    }
  }
  &:focus{
    outline:0px !important;
    -webkit-appearance:none;
  }
  &-inline{
    display: inline;
  }
  &-transparent{
    background: transparent;
  }
  &-opacity{
    background-color: rgba($main-background, .3);
  }
  &-small{
    padding: 8px 10px;
    font-size: 12px;
  }
  &-big{
    padding: 15px;
  }
}

.form-control-btn{
  position: absolute;
  right: 0;
  z-index: 9;
  width: 46px;
  height: 100%;
  text-align: center;
  &-icon{
    width: 18px;
    height: 18px;
  }
}

.form-quantity{
  padding: 0;
  .form-control{
    width: 100%;
    padding: 0;
    background-color: transparent;
    -webkit-appearance: none;
    -moz-appearance:textfield;
    border: 0;
    text-align: center;
  }
  &.small{
    width: 120px;
    padding: 15px;
  }
  &-product {
    line-height: 46px;
  }
}

input::-webkit-inner-spin-button,
input::-webkit-outer-spin-button{
  -webkit-appearance: none;
  margin: 0;
}

input[type=number] {
  -moz-appearance:textfield;
}

.search-input {
  height: 100%;
  padding-right: 60px;
  font-size: var(--font-base);
  border: 0;
  &:hover,
  &:focus,
  &:active {
    border: 0;
  }
}

{# IOS form CSS to avoid autozoom on focus #}

.form-control-ios,
.form-group-quantity-ios .form-control-ios {
  /* enlarge by 16/12 = 133.33% */
  font-size: 18px;
  line-height: 31.666666667px;
  width: 133.333333333%;
  margin-bottom: -15px;

  /* scale down by 12/16 = 75% */
  transform: scale(0.75);
  transform-origin: left top;
  transition: none;

  &.search-input {
    height: 65px;
    margin-bottom: -5px;
    font-size: var(--h4);
    border-radius: 0;
  }
}

.form-control-ios.form-control-area {
  margin-bottom: -64px;
}

.form-group-quantity-ios .form-control-ios{
  padding-top: 8px;  
}

.search-container-ios {
  height: 49px;
} 

.cart-quantity-container-ios {
  height: 22px;
  .form-control-ios {
    padding-left: 8px;
  }
}
.form-select{
  cursor: pointer;
  &.btn {
    font-size: 10px;
    &.btn-medium {
      padding: 6px 8px;
      .form-select-icon {
        bottom: 7px;
      }
    }
  }
}

.form-select-icon{
  background: $main-background;
  fill: $main-foreground;
}

.input-clear-content:before {
  content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" fill="{{ settings.text_color |replace("#","%23") }}"><path d="M256,274.92,72.67,458.25l-18.1-18.1L237.9,256.82,54.57,73.49l18.1-18.11L256,238.72,439.33,55.38l18.1,18.11L274.1,256.82,457.43,440.15l-18.1,18.1Z"/></svg>');
}

.radio-button {
  &-icon {
    &.unchecked{
      background-color: $main-background;
      border: var(--border-solid) rgba($main-foreground, .5);
    }
    &.checked {
      background-color: $main-foreground;
    }
  }
}

.list .radio-button .radio-button-content .radio-button-icon {
  background-color: $main-foreground;
}

.checkbox-container{
  .checkbox-icon {
    background: $main-background;
    border-right: var(--border-solid) $border-color;
    &:after {
      border: solid $main-foreground;
      border-width: 0 1px 1px 0;
    }
    &.with-color {
      &:before {
        border: solid $main-foreground;
        border-width: 0 4px 4px 0;
      }
      &:after {
        border: solid $main-background;
        border-width: 0 2px 2px 0;
      }
    }
  }
  .checkbox:hover,
  input:checked ~ .checkbox {
    color: $main-foreground;
    fill: $main-foreground;
  }
  .checkbox-color{
    border: var(--border-solid) rgba($border-color, .06);
  }
}

.g-recaptcha>div {
  border-left: var(--border-solid) $border-color;
  border-right: var(--border-solid) $border-color;
}

{# /* // Alerts and notifications */ #}

.alert{
  &:before{
    display: inline-block;
    width: 12px;
    height: 12px;
    margin-right: 5px;
    vertical-align: top;
  }
  &-danger,
  &-error{
    color: set-foreground-color($main-background, #cc4845);
    border-color: set-foreground-color($main-background, #cc4845);
    &:before{
      content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" fill="%23cc4845"><path d="M256 40c118.621 0 216 96.075 216 216 0 119.291-96.61 216-216 216-119.244 0-216-96.562-216-216 0-119.203 96.602-216 216-216m0-32C119.043 8 8 119.083 8 256c0 136.997 111.043 248 248 248s248-111.003 248-248C504 119.083 392.957 8 256 8zm-11.49 120h22.979c6.823 0 12.274 5.682 11.99 12.5l-7 168c-.268 6.428-5.556 11.5-11.99 11.5h-8.979c-6.433 0-11.722-5.073-11.99-11.5l-7-168c-.283-6.818 5.167-12.5 11.99-12.5zM256 340c-15.464 0-28 12.536-28 28s12.536 28 28 28 28-12.536 28-28-12.536-28-28-28z"/></svg>');
    }
  }
  &-warning{
    color: set-foreground-color($main-background, #d27611);
    border-color: set-foreground-color($main-background, #d27611);
    &:before{
      content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" fill="%23d27611"><path d="M270.2 160h35.5c3.4 0 6.1 2.8 6 6.2l-7.5 196c-.1 3.2-2.8 5.8-6 5.8h-20.5c-3.2 0-5.9-2.5-6-5.8l-7.5-196c-.1-3.4 2.6-6.2 6-6.2zM288 388c-15.5 0-28 12.5-28 28s12.5 28 28 28 28-12.5 28-28-12.5-28-28-28zm281.5 52L329.6 24c-18.4-32-64.7-32-83.2 0L6.5 440c-18.4 31.9 4.6 72 41.6 72H528c36.8 0 60-40 41.5-72zM528 480H48c-12.3 0-20-13.3-13.9-24l240-416c6.1-10.6 21.6-10.7 27.7 0l240 416c6.2 10.6-1.5 24-13.8 24z"/></svg>');
    }
  }
  &-info{
    color: set-foreground-color($main-background, #3d9ccc);
    border-color: set-foreground-color($main-background, #3d9ccc);
    &:before{
      content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" fill="%233d9ccc"><path d="M256 40c118.621 0 216 96.075 216 216 0 119.291-96.61 216-216 216-119.244 0-216-96.562-216-216 0-119.203 96.602-216 216-216m0-32C119.043 8 8 119.083 8 256c0 136.997 111.043 248 248 248s248-111.003 248-248C504 119.083 392.957 8 256 8zm-36 344h12V232h-12c-6.627 0-12-5.373-12-12v-8c0-6.627 5.373-12 12-12h48c6.627 0 12 5.373 12 12v140h12c6.627 0 12 5.373 12 12v8c0 6.627-5.373 12-12 12h-72c-6.627 0-12-5.373-12-12v-8c0-6.627 5.373-12 12-12zm36-240c-17.673 0-32 14.327-32 32s14.327 32 32 32 32-14.327 32-32-14.327-32-32-32z"/></svg>');
    }
  }
  &-success{
    color: set-foreground-color($main-background, #3caf65);
    border-color: set-foreground-color($main-background, #3caf65);
    &:before{
      content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" fill="%233caf65"><path d="M256 8C119.033 8 8 119.033 8 256s111.033 248 248 248 248-111.033 248-248S392.967 8 256 8zm0 464c-118.664 0-216-96.055-216-216 0-118.663 96.055-216 216-216 118.664 0 216 96.055 216 216 0 118.663-96.055 216-216 216zm141.63-274.961L217.15 376.071c-4.705 4.667-12.303 4.637-16.97-.068l-85.878-86.572c-4.667-4.705-4.637-12.303.068-16.97l8.52-8.451c4.705-4.667 12.303-4.637 16.97.068l68.976 69.533 163.441-162.13c4.705-4.667 12.303-4.637 16.97.068l8.451 8.52c4.668 4.705 4.637 12.303-.068 16.97z"/></svg>');
    }
  }
  &-primary {
    border-color: $accent-color;
    color: $accent-color;
  }
}

.item-actions .alert {
  color: $main-foreground;
  background-color: $main-background;
  border-top: var(--border-solid) $border-color;
  border-bottom: var(--border-solid) $border-color;
  border-left: var(--border-solid) $border-color;
  &:before{
    content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" fill="%23{{ settings.text_color |trim('#') }}"><path d="M270.2 160h35.5c3.4 0 6.1 2.8 6 6.2l-7.5 196c-.1 3.2-2.8 5.8-6 5.8h-20.5c-3.2 0-5.9-2.5-6-5.8l-7.5-196c-.1-3.4 2.6-6.2 6-6.2zM288 388c-15.5 0-28 12.5-28 28s12.5 28 28 28 28-12.5 28-28-12.5-28-28-28zm281.5 52L329.6 24c-18.4-32-64.7-32-83.2 0L6.5 440c-18.4 31.9 4.6 72 41.6 72H528c36.8 0 60-40 41.5-72zM528 480H48c-12.3 0-20-13.3-13.9-24l240-416c6.1-10.6 21.6-10.7 27.7 0l240 416c6.2 10.6-1.5 24-13.8 24z"/></svg>');
  }
}

.bg-primary{
  .alert{
    &-danger,
    &-error{
      color: $main-background;
      border-color: $main-background;
      &:before{
        content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" fill="%23{{ settings.background_color |trim('#') }}"><path d="M256 40c118.621 0 216 96.075 216 216 0 119.291-96.61 216-216 216-119.244 0-216-96.562-216-216 0-119.203 96.602-216 216-216m0-32C119.043 8 8 119.083 8 256c0 136.997 111.043 248 248 248s248-111.003 248-248C504 119.083 392.957 8 256 8zm-11.49 120h22.979c6.823 0 12.274 5.682 11.99 12.5l-7 168c-.268 6.428-5.556 11.5-11.99 11.5h-8.979c-6.433 0-11.722-5.073-11.99-11.5l-7-168c-.283-6.818 5.167-12.5 11.99-12.5zM256 340c-15.464 0-28 12.536-28 28s12.536 28 28 28 28-12.536 28-28-12.536-28-28-28z"/></svg>');
      }
    }
    &-warning{
      color: $main-background;
      border-color: $main-background;
      &:before{
        content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" fill="%23{{ settings.background_color |trim('#') }}"><path d="M270.2 160h35.5c3.4 0 6.1 2.8 6 6.2l-7.5 196c-.1 3.2-2.8 5.8-6 5.8h-20.5c-3.2 0-5.9-2.5-6-5.8l-7.5-196c-.1-3.4 2.6-6.2 6-6.2zM288 388c-15.5 0-28 12.5-28 28s12.5 28 28 28 28-12.5 28-28-12.5-28-28-28zm281.5 52L329.6 24c-18.4-32-64.7-32-83.2 0L6.5 440c-18.4 31.9 4.6 72 41.6 72H528c36.8 0 60-40 41.5-72zM528 480H48c-12.3 0-20-13.3-13.9-24l240-416c6.1-10.6 21.6-10.7 27.7 0l240 416c6.2 10.6-1.5 24-13.8 24z"/></svg>');
      }
    }
    &-info{
      color: $main-background;
      border-color: $main-background;
      &:before{
        content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" fill="%23{{ settings.background_color |trim('#') }}"><path d="M256 40c118.621 0 216 96.075 216 216 0 119.291-96.61 216-216 216-119.244 0-216-96.562-216-216 0-119.203 96.602-216 216-216m0-32C119.043 8 8 119.083 8 256c0 136.997 111.043 248 248 248s248-111.003 248-248C504 119.083 392.957 8 256 8zm-36 344h12V232h-12c-6.627 0-12-5.373-12-12v-8c0-6.627 5.373-12 12-12h48c6.627 0 12 5.373 12 12v140h12c6.627 0 12 5.373 12 12v8c0 6.627-5.373 12-12 12h-72c-6.627 0-12-5.373-12-12v-8c0-6.627 5.373-12 12-12zm36-240c-17.673 0-32 14.327-32 32s14.327 32 32 32 32-14.327 32-32-14.327-32-32-32z"/></svg>');
      }
    }
    &-success{
      color: $main-background;
      border-color: $main-background;
      &:before{
        content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" fill="%23{{ settings.background_color |trim('#') }}"><path d="M256 8C119.033 8 8 119.033 8 256s111.033 248 248 248 248-111.033 248-248S392.967 8 256 8zm0 464c-118.664 0-216-96.055-216-216 0-118.663 96.055-216 216-216 118.664 0 216 96.055 216 216 0 118.663-96.055 216-216 216zm141.63-274.961L217.15 376.071c-4.705 4.667-12.303 4.637-16.97-.068l-85.878-86.572c-4.667-4.705-4.637-12.303.068-16.97l8.52-8.451c4.705-4.667 12.303-4.637 16.97.068l68.976 69.533 163.441-162.13c4.705-4.667 12.303-4.637 16.97.068l8.451 8.52c4.668 4.705 4.637 12.303-.068 16.97z"/></svg>');
      }
    }
    &-primary {
      border-color: $main-background;
      color: $main-background;
    }
  }
}

.notification {
    &-primary {
      color: $main-foreground;
      fill: $main-foreground;
      background-color: $main-background;
      border-top: var(--border-solid) $border-color;
      border-bottom: var(--border-solid) $border-color;
    }
    &-arrow-up {
        border-right: 10px solid transparent;
        border-bottom: 10px solid $main-background;
        border-left: 10px solid transparent;
    }
    &-floating .notification-primary {
        color: $main-foreground;
        fill: $main-foreground;
        background-color: $main-background;
        border-top: var(--border-solid) $border-color;
        border-bottom: var(--border-solid) $border-color;
    }
    &-secondary {
        background: $accent-color;
        color: $main-background;
        fill: $main-background;
    }
    &-tertiary {
        color: $accent-color;
        background: lighten($main-foreground, 80%);
    }
    &-img svg {
        border-radius: 100%;
        background: $main-background;
    }
    &-danger {
      color: set-foreground-color($main-background, #cc4845);
      border-bottom: var(--border-solid) set-foreground-color($main-background, #cc4845);
    }
}

{# /* // Tooltip */ #}

.tooltip{
  background: $main-background;
  color: $main-foreground;
  border: var(--border-solid) $border-color;
  &-icon {
    border: var(--border-solid) $border-color;
  }
  &-arrow{
    position: absolute;
    border-left: 10px solid transparent;
    border-right: 10px solid transparent;
    border-bottom: 10px solid $border-color;
    &:after{
      position: absolute;
      top: 1px;
      right: -9px;
      border-left: 9px solid transparent;
      border-right: 9px solid transparent;
      border-bottom: 9px solid $main-background;
      content: '';
    }
  }
}

{# /* // Images */ #}

.card-img{
  @extend %border-radius-small;
  &-pill {
    background-color: $main-background;
    color: $main-foreground;
  }
  &-small {
    border-radius: 2px;
  }
}

{# /* // Tables */ #}

.table{
  background-color: $main-background;
  color: $main-foreground;
  tbody{
    tr:nth-child(odd){
      background-color: rgba($main-foreground, .05);
    }
  }
  th{
    padding: 8px;
    text-align: left;
  }
}

{# /* // Tabs */ #}

.tab-group{
  .tab{
    &-link{
      border: var(--border-solid) rgba($main-foreground, .3);
      color: $main-foreground;
    }
    &.active{
      .tab-link{
        border: var(--border-solid) $button-background;
        color: $button-background;
        background: rgba($button-background, .1);
      }
    }
  }
}

{# /* Cards */ #}

.card {
  @extend .item;
}

{# /* // Sliders */ #}

.swiper-text {
  @extend %simplefade;
  opacity: 0;
  bottom: 0;
  left: -60px;
  color: $main-foreground;
  border-top: var(--border-solid) $border-color;
  border-right: var(--border-solid) $border-color;
  &-light {
    color: $main-background;
  }
}

.swiper-slide-active .swiper-text {
  left: 0;
  opacity: 1;
}

.swiper-light.bottom-line {
  border-color: $main-background;
}
.swiper-text-light {
  color: $main-background;
  border-color: $main-background;
  .top-line,
  .left-line {
    border-color: $main-background;
  }
  .btn-link {
    color: $main-background;
  }
}

.swiper-button-next,
.swiper-button-prev {
  border: var(--border-solid) $border-color;
}

.swiper-button-next {
  margin-left: -1px;
}

.swiper-arrows-light .swiper-button-next,
.swiper-arrows-light .swiper-button-prev {
  border-color: $main-background;
  fill: $main-background;
}

.swiper-pagination-fraction {
  background-color: $main-background;
  border-top: var(--border-solid) $border-color;
  border-right: var(--border-solid) $border-color;
}

.swiper-pagination-bullet,
.swiper-pagination-bullet-active {
  background-color: $main-foreground;
}

{#/*============================================================================
  #Home Page
==============================================================================*/#}

{# /* // Home banners */ #}

.textbanner-text {
  &.over-image {
    background-image: linear-gradient(transparent, rgba($main-background, .4));
    color: $main-foreground;
    a {
      color: $main-foreground;
    }
    .btn-secondary {
      color: $main-foreground;
      border: var(--border-solid) $border-color;
    }
    .svg-icon-text {
      fill: $main-foreground;
    }
    &.over-image-invert {
      background-image: linear-gradient(transparent, rgba($main-foreground, .4));
      color: $main-background;
      a {
        color: $main-background;
      }
      .top-line,
      .left-line,
      &.right-line-md {
        border-color: $main-background;
      }
      .btn-link {
        color: $main-background;
      }
      .svg-icon-text {
        fill: $main-background;
      }
    }
  }
}

{# /* // Brands */ #}

.section-brands-home {
  {% if settings.brands_colors %}
    background: $brands-background;
    color: $brands-foreground;
    .bottom-line,
    .right-line,
    .swiper-button-next,
    .swiper-button-prev {
      border-color: $brands-foreground;
    }
    .svg-icon-text {
      fill: $brands-foreground;
    }
  {% else %}
    background: transparent;
  {% endif %}
}

{# /* // Testimonials */ #}

.section-testimonials-home {
  {% if settings.testimonials_colors %}
    background: $testimonials-background;
    color: $testimonials-foreground;
    .right-line,
    .right-line-md,
    .bottom-line,
    .bottom-line-md,
    .left-line {
      border-color: $testimonials-foreground;
    }
  {% else %}
    background: transparent;
  {% endif %}
}

{# /* // Welcome message */ #}

{% if settings.welcome_colors %}
  .section-welcome-home {
    background: $welcome-background;
    color: $welcome-foreground;
    .btn-link {
      color: $welcome-foreground;
    }
  }
{% endif %}

{# /* // Institutional message */ #}

{% if settings.institutional_colors %}
  .section-institutional-home {
    background: $institutional-background;
    color: $institutional-foreground;
    .btn-link {
      color: $institutional-foreground;
    }
  }
{% endif %}

{# /* // Video */ #}

.embed-responsive {
  background: $main-foreground;
}

.video-player-icon {
  background: $main-background;
  border: var(--border-solid) $border-color;
}

.section-video-home.bottom-line {
  border-color: $video-color;
}

.home-video-text {
  color: $video-color;
  .btn-link {
    color: $video-color;
  }
  .top-line,
  .right-line-md,
  .left-line,
  &.top-line,
  &.right-line-md,
  &.bottom-line {
    border-color: $video-color;
  }
}

.home-video-overlay:after {
  background: linear-gradient(transparent, rgba($main-foreground, .4));
}

{# /* // Instafeed */ #}
.instafeed-title {
  color: $main-foreground;
}

.instafeed-info {
  color: $main-background;
  background: rgba($main-foreground, .6);
}

{# /* // Newsletter */ #}

.section-newsletter-home {
  {% if settings.home_news_colors %}
    background: $newsletter-background;
    color: $newsletter-foreground;
    .form-control {
      color: $newsletter-foreground;
      background-color: rgba($newsletter-foreground, .1);
      border-color: $newsletter-foreground;
      &:hover,
      &:active {
        border: var(--border-solid) rgba($newsletter-foreground, .6);
      }
    }
    .btn-primary {
      background-color: $newsletter-foreground;
      color: $newsletter-background;
    }
    .top-line,
    .right-line,
    &.bottom-line {
      border-color: $newsletter-foreground;
    }
    .newsletter-btn {
      fill: $newsletter-foreground;
    }
    .form-control::-webkit-input-placeholder { 
      color: rgba($newsletter-foreground, .5);
    }
    .form-control:-moz-placeholder {
      color: rgba($newsletter-foreground, .5);
    }
    .form-control::-moz-placeholder {
      color: rgba($newsletter-foreground, .5);
    }
    .form-control:-ms-input-placeholder {
      color: rgba($newsletter-foreground, .5);
    }
    .alert-success,
    .alert-danger {
      color: $newsletter-foreground;
      border-color: $newsletter-foreground;
    }
    .alert-success:before{
      content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" fill="%23{{ settings.home_news_foreground_color |trim('#') }}"><path d="M256 8C119.033 8 8 119.033 8 256s111.033 248 248 248 248-111.033 248-248S392.967 8 256 8zm0 464c-118.664 0-216-96.055-216-216 0-118.663 96.055-216 216-216 118.664 0 216 96.055 216 216 0 118.663-96.055 216-216 216zm141.63-274.961L217.15 376.071c-4.705 4.667-12.303 4.637-16.97-.068l-85.878-86.572c-4.667-4.705-4.637-12.303.068-16.97l8.52-8.451c4.705-4.667 12.303-4.637 16.97.068l68.976 69.533 163.441-162.13c4.705-4.667 12.303-4.637 16.97.068l8.451 8.52c4.668 4.705 4.637 12.303-.068 16.97z"/></svg>');
    }
    .alert-danger:before{
      content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" fill="%23{{ settings.home_news_foreground_color |trim('#') }}"><path d="M256 40c118.621 0 216 96.075 216 216 0 119.291-96.61 216-216 216-119.244 0-216-96.562-216-216 0-119.203 96.602-216 216-216m0-32C119.043 8 8 119.083 8 256c0 136.997 111.043 248 248 248s248-111.003 248-248C504 119.083 392.957 8 256 8zm-11.49 120h22.979c6.823 0 12.274 5.682 11.99 12.5l-7 168c-.268 6.428-5.556 11.5-11.99 11.5h-8.979c-6.433 0-11.722-5.073-11.99-11.5l-7-168c-.283-6.818 5.167-12.5 11.99-12.5zM256 340c-15.464 0-28 12.536-28 28s12.536 28 28 28 28-12.536 28-28-12.536-28-28-28z"/></svg>');
    }
  {% else %}
    background: rgba($main-foreground, .1);
  {% endif %}
}

{#/*============================================================================
  #Product grid
==============================================================================*/#}

{# /* // Category controls */ #}

.category-controls {
  background-color: $main-background;
  &.category-controls-transparent {
    background-color: transparent;
  }
  &.is-sticky .category-controls-transparent .btn-link {
    color: $header-foreground;
    fill: $header-foreground;
  }
}

.filters-badge {
  background-color: $main-foreground;
  color: $main-background;
}
.filters-overlay {
  background-color: rgba($main-background, .85);
}

.filters-container {
  border-bottom: var(--border-solid) $border-color;
  .filter-item {
    border-bottom: var(--border-solid) $border-color;
    border-right: var(--border-solid) $border-color;
    &:last-child,
    &:nth-last-child(2):nth-child(odd){
      border-bottom: none;
    }
    &:nth-child(even) {
      border-right: none;
    }
  }
  .filters-container-more-items {
    border-bottom: none;
   .filter-item {
      &:first-child,
      &:nth-child(2){
        border-bottom: var(--border-solid) $border-color;
      }
    }
  }
}

.price-filter-container {
  .filter-input-price {
    border: none;
  }
  .form-label,
  .filter-input-price-container{
    border-right: var(--border-solid) $border-color;
  }
}

{# /* // Grid item */ #}

.item {
  @include prefix(transition, all 0.4s ease, webkit ms moz o);
  &-link {
    color: $main-foreground;
    fill: $main-foreground;
  }
  &-price {
    color: $main-foreground;
  }
}

.modal-quickshop .alert-warning {
  background-color: $main-background;
  border-left: var(--border-solid);
}

{# /* // Labels */ #}

.label {
  background: $main-background;
  color: $main-foreground;
  border-bottom: var(--border-solid) $main-foreground;
  border-left: var(--border-solid) $main-foreground;
  &.label-accent{
    background: $label-background;
    color: $label-foreground;
    border-color: $label-foreground;
  }
  &.label-default{
    background: $main-foreground;
    color: $main-background;
  }
}

{#/*============================================================================
  #Product detail
==============================================================================*/#}

{# /* // Image */ #}

.product-video-container {
  background-color: rgba($main-foreground, .07);
}

.fancybox__toolbar {
  color: $main-foreground;
  background: transparent !important;
  text-shadow: none !important;
  border-bottom: var(--border-solid) $border-color;
}
.fancybox__container .fancybox__backdrop {
  background: rgba($main-background, .9);
}
.carousel__button .svg-icon-text {
  fill: $main-foreground;
  filter: none;
}

.carousel__button.swiper-button-next {
  border-color: $border-color;
}

{# /* // Form and info */ #}
    
.social-share {
  @extend %element-margin;
  .social-share-button {
    color: $main-foreground;
  }
}

{#/*============================================================================
  #Cart
==============================================================================*/#}

.total-promotions-row  {
  border-bottom: var(--border-solid) $border-color;
}

{#/*============================================================================
  #Contact page
==============================================================================*/#}

{# /* // Data contact */ #}

.contact-item {
  @extend %element-margin;
  &-icon {
    fill: $main-foreground;
  }
}

.contact-link {
  color: $main-foreground;
}

{#/*============================================================================
  #Header and nav
==============================================================================*/#}

{# /* // Header */ #}

.head-main {
  color: $header-foreground;
  fill: $header-foreground;
  background-color: $header-background;
  border-bottom: var(--border-solid) $header-border;
  .top-line,
  .right-line,
  .right-line-md,
  .bottom-line,
  .bottom-line-md,
  .left-line,
  .left-line-md {
    border-color: $header-border;
  }
  .btn-link {
    color: $header-foreground;
    fill: $header-foreground;
  }
  .section-adbar {
    background-color: $adbar-background;
    color: $adbar-foreground;
    fill: $adbar-foreground;
    a,
    .svg-icon-text {
      color: $adbar-foreground;
      fill: $adbar-foreground;
    }
    .swiper-button-absolute {
      border: 0;
    }
  }

  .form-control{
    background-color: transparent;
    color: $header-foreground;
    fill: $header-foreground;
    &::-webkit-input-placeholder { 
      color: rgba($header-foreground, .5);
    }
    &:-moz-placeholder {
      color: $header-foreground;
    }
    &::-moz-placeholder {
      color: $header-foreground;
    }
    &:-ms-input-placeholder {
      color: $header-foreground;
    }
  }
  a,
  .svg-icon-text {
    color: $header-foreground;
    fill: $header-foreground;
  }
  .search-suggest {
    background-color: $header-background;
    border: var(--border-solid) $header-foreground;
    a,
    .btn-link {
      color: $header-foreground;
      fill: $header-foreground;
    }
  }

  {% if settings.logo_position_desktop == 'center' %}
  .nav-desktop,
  {% endif %}
  .desktop-dropdown {
    border-top: var(--border-solid) $header-border;
  }
  

  .nav-primary {
    background-color: $header-background;
    .nav-list {
      .nav-item {
        border-color: rgba($header-foreground, .2);
      }
      .list-subitems {
        background-color: set-subnav-color($header-foreground);
      }
    } 
  }

  .notification-primary {
    a {
      color: $main-foreground;
      fill: $main-foreground;
    }
    .btn-primary {
      color: $button-foreground;
      fill: $button-foreground;
    }
    .right-line {
      border-color: $border-color;
    }
  } 
}

.head-transparent,
.head-transparent-on-section{
  background: transparent;
  .desktop-list-subitems {
    background-color: $header-background;
  }
  .notification-primary {
    color: $header-foreground;
    fill: $header-foreground;
    background: transparent;
    border-top: var(--border-solid) $header-foreground;
    border-bottom: var(--border-solid) $header-foreground;
    a {
      color: $header-foreground;
      fill: $header-foreground;
    }
  }
  .notification-cart {
    color: $main-foreground;
    background-color: $main-background;
    border-color: $border-color;
    .right-line {
      border-color: $border-color;
    }
  }
  &:hover,
  &.hover {
    background-color: $header-background;
  }
}

{% if settings.head_transparent_contrast_options %}
  .head-transparent-on-section.head-transparent-contrast:not(:hover) {
    color: $header-transparent-foreground;
    fill: $header-transparent-foreground;
    border-bottom: var(--border-solid) $header-transparent-foreground;
    {% if settings.logo_position_desktop == 'center' %}
    .nav-desktop,
    {% endif %}
    .desktop-dropdown,
    .top-line,
    .right-line,
    .right-line-md,
    .bottom-line,
    .bottom-line-md,
    .left-line,
    .left-line-md {
      border-color: $header-transparent-foreground;
    }
    .form-control{
      color: $header-transparent-foreground;
      fill: $header-transparent-foreground;
      &::-webkit-input-placeholder { 
        color: rgba($header-transparent-foreground, .5);
      }
      &:-moz-placeholder {
        color: $header-transparent-foreground;
      }
      &::-moz-placeholder {
        color: $header-transparent-foreground;
      }
      &:-ms-input-placeholder {
        color: $header-transparent-foreground;
      }
    }
    a,
    .search-input-submit {
      color: $header-transparent-foreground;
      fill: $header-transparent-foreground;
    }
    .section-adbar a {
      color: $adbar-foreground;
    }
    .search-suggest-link,
    .btn-link {
      color: $header-foreground;
    }
    .notification-cart {
      color: $main-foreground;
      background-color: $main-background;
      border-color: $border-color;
      .right-line {
        border-color: $border-color;
      }
    }
  }
{% endif %}

.nav-list-panel {
  color: $main-foreground;
  fill: $main-foreground;
  background-color: $main-background;
}

.nav-desktop-list>.nav-item-desktop>.nav-item-container>.nav-list-link:after {
  background: $header-foreground;
}

.modal-nav-hamburger {
  .search-input{
    background-color: rgba($main-foreground, .02);
    border-bottom: var(--border-solid) $border-color;
  }
  .search-suggest {
    background-color: $main-background;
    border-bottom: var(--border-solid) $border-color;
    box-shadow: 0 3px 5px rgba($main-foreground,.2);
  }
}

{# /* // Utilities */ #}

.subutility-list {
 background-color: $header-background;
 box-shadow: 0 1px 6px rgba(0,0,0,0.2);
}

{# /* // Nav */ #}

.desktop-list-subitems {
  background-color: $header-background;
  border-bottom: var(--border-solid) $header-border;
}

.desktop-dropdown::-webkit-scrollbar-track {
  background: rgba($header-background, .5);
}
.desktop-dropdown::-webkit-scrollbar-thumb {
  background: rgba($header-foreground, .8%);
}
.desktop-dropdown::-webkit-scrollbar-thumb:hover {
  background: $header-foreground;
}

.nav-categories-container:after,
.nav-categories-container:before {
  background-image: linear-gradient(-90deg, transparent, darken($header-background, 2%));
}

{#/*============================================================================
  #Footer
==============================================================================*/#}

$footer-background-color: $footer-background;
$footer-foreground-color: $footer-foreground;
$footer-border-color: $footer-border;

footer {
  color: $footer-foreground-color;
  background: $footer-background-color;
  a,
  .contact-link,
  .footer-menu-item {
    color: $footer-foreground-color;
  }
  a:hover {
    color: rgba($footer-foreground-color, .8);
  }
  svg {
    fill: $footer-foreground-color;
  }
  .form-control,
  .form-select {
    color: $footer-foreground-color;
    background-color: transparent;
    border-color: $footer-border-color;
    &:hover,
    &:active {
      border-color: rgba($footer-border-color, .6);
    }
  }
  .form-select-icon {
    background-color: $footer-background-color;
  }
  .form-control::-webkit-input-placeholder { 
    color: rgba($footer-foreground-color, .5);
  }
  .form-control:-moz-placeholder {
    color: rgba($footer-foreground-color, .5);
  }
  .form-control::-moz-placeholder {
    color: rgba($footer-foreground-color, .5);
  }
  .form-control:-ms-input-placeholder {
    color: rgba($footer-foreground-color, .5);
  }
  .footer-payments-shipping-logos img {
    border: var(--border-solid) rgba($footer-foreground-color, .2);
  }
  {% if settings.footer_colors %}
    .top-line,
    .right-line,
    .right-line-md,
    .bottom-line,
    .bottom-line-md,
    .left-line,
    .btn-line {
      border-color: $footer-foreground-color;
    }
    .btn-link {
      color: $footer-foreground-color;
    }
    .btn-primary {
      background-color: $footer-foreground-color;
      color: $footer-background-color;
      &:hover,
      &:focus {
        background-color: $footer-foreground-color;
        color: $footer-background-color;
      }
    }
    .alert-success,
    .alert-danger {
      color: $footer-foreground-color;
      border-color: $footer-foreground-color;
    }
    .alert-success:before{
      content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" fill="%23{{ settings.footer_foreground_color |trim('#') }}"><path d="M256 8C119.033 8 8 119.033 8 256s111.033 248 248 248 248-111.033 248-248S392.967 8 256 8zm0 464c-118.664 0-216-96.055-216-216 0-118.663 96.055-216 216-216 118.664 0 216 96.055 216 216 0 118.663-96.055 216-216 216zm141.63-274.961L217.15 376.071c-4.705 4.667-12.303 4.637-16.97-.068l-85.878-86.572c-4.667-4.705-4.637-12.303.068-16.97l8.52-8.451c4.705-4.667 12.303-4.637 16.97.068l68.976 69.533 163.441-162.13c4.705-4.667 12.303-4.637 16.97.068l8.451 8.52c4.668 4.705 4.637 12.303-.068 16.97z"/></svg>');
    }
    .alert-danger:before{
      content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" fill="%23{{ settings.footer_foreground_color |trim('#') }}"><path d="M256 40c118.621 0 216 96.075 216 216 0 119.291-96.61 216-216 216-119.244 0-216-96.562-216-216 0-119.203 96.602-216 216-216m0-32C119.043 8 8 119.083 8 256c0 136.997 111.043 248 248 248s248-111.003 248-248C504 119.083 392.957 8 256 8zm-11.49 120h22.979c6.823 0 12.274 5.682 11.99 12.5l-7 168c-.268 6.428-5.556 11.5-11.99 11.5h-8.979c-6.433 0-11.722-5.073-11.99-11.5l-7-168c-.283-6.818 5.167-12.5 11.99-12.5zM256 340c-15.464 0-28 12.536-28 28s12.536 28 28 28 28-12.536 28-28-12.536-28-28-28z"/></svg>');
    }
  {% endif %}
}

.social-icon {
  fill: $footer-foreground-color;
  &:hover {
    opacity: .8;
  }
}

.section-footer {
  @extend %section-margin;
}
.element-footer {
  @extend %element-margin;
}

.powered-by-logo svg {
  fill: $footer-foreground-color;
}

.footer-legal {
  color: $footer-foreground-color;
  a {
    color: $footer-foreground-color;
    &:hover {
      opacity: .8;
    }
  }
}

{#/*============================================================================
  #Media queries
==============================================================================*/ #}

{# /* // Min width 768px */ #}

@media (min-width: 768px) { 

  {# /* //// Components */ #}

  .btn-medium-md {
    padding: 10px 15px;
    font-size: 14px;
    line-height: 18px;
    letter-spacing: 0;
  }

  .modal {
    &-centered-md {
      border: var(--border-solid) $border-color;
    }
    &-right-md {
      border-left: var(--border-solid) $border-color;
    }
    &-left-md,
    &-left {
      border-right: var(--border-solid) $border-color;
    }
    &-nav-search {
      border-right: var(--border-solid) $border-color;
      .modal-close {
        background-color: $main-background;
        border-top: var(--border-solid) $border-color;
      }
      .modal-body {
        border-bottom: var(--border-solid) $border-color;
        border-left: var(--border-solid) $border-color;
      }
      .search-input {
        border-bottom: none;
        &:hover,
        &:focus,
        &:active {
          border-bottom: none;
        }
      }
      .search-suggest {
        background-color: $main-background;
        border-top: var(--border-solid) $border-color;
      }
    }
  }

  .modal::-webkit-scrollbar-track,
  .modal-scrollable-area::-webkit-scrollbar-track {
    background: rgba($main-foreground, .4);
  }
  .modal::-webkit-scrollbar-thumb,
  .modal-scrollable-area::-webkit-scrollbar-thumb {
    background: rgba($main-foreground, .8%);
  }
  .modal::-webkit-scrollbar-thumb:hover,
  .modal-scrollable-area::-webkit-scrollbar-thumb:hover {
    background: $main-foreground;
  }

  .top-line-md {
    border-top: var(--border-solid) $border-color;
  }

  .top-no-line-md {
    border-top: none;
  }

  .right-line-md {
    border-right: var(--border-solid) $border-color;
  }

  .right-no-line-md {
    border-right: none;
  }

  .right-transparent-line-md {
    border-color: transparent;
  }

  .bottom-line-md {
    border-bottom: var(--border-solid) $border-color;
  }

  .bottom-no-line-md {
    border-bottom: none;
  }

  .left-line-md {
    border-left: var(--border-solid) $border-color;
  }

  .left-no-line-md {
    border-left: none;
  }

  .no-line-md {
    border: 0;
  }

  {# /* // Notifications */ #}

  .notification-floating .notification-primary {
    border-right: var(--border-solid) $border-color;
    border-left: var(--border-solid) $border-color;
  }

  {# /* Header */ #}

  {% if settings.logo_size == 'big' and settings.search_big_desktop %}
    .search-input {
      {% if settings.utilities_type_desktop == 'text' %}
        padding: 15px 20px;
      {% else %}
        padding: 15px 30px;
      {% endif %}
    }
  {% endif %}

  .modal-nav-hamburger {
    .nav-list-panel-left-md{
      border-right: var(--border-solid) $border-color;
    }
    .nav-list-panel-right-md{
      border-left: var(--border-solid) $border-color;
    }
  }

  {# /* //// Home Banners */ #}

  .textbanner-shadow {
    @include prefix(transition, all 0.4s ease, webkit ms moz o);
    &:hover {
      box-shadow: 0 1px 10px rgba($main-foreground, .2);
    }
  }

  {# /* //// Product grid */ #}

  .item {
    &-description {
      @include prefix(transition, all 0.4s ease, webkit ms moz o);
    }
  }
}