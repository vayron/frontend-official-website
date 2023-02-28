<template>
  <div class="layout">
    <section class="pop" v-show="isPopShow" @click="onPop">
      <div class="bg">
        <img src="~/assets/img/qcode.png" />
        <p>微信扫码加入社群</p>
      </div>
    </section>

    <header>
      <video
        loop
        muted
        autoplay
        playsinline
        x5-playsinline
        webkit-playsinline="true"
        poster="//cdn.visionstory.cn/www/cover.png"
        x5-video-player-type="h5-page"
      ></video>
      <!-- <div class="mask"></div> -->
      <div class="content">
        <div class="title">
          <span>迎接视频制作新时代</span>
        </div>
        <div class="summary">
          上传角色2D图，输入文字脚本，见证全新视频的诞生
        </div>
        <div
          class="btn"
          @click="onPop"
          data-track="contact_btn"
          id="contact_btn"
        >
          <span><i></i>联系我们</span>
        </div>
      </div>
    </header>

    <section class="source-to-generated container">
      <div class="mode-title">
        <h2>2D角色图片转视频</h2>
        <p>通过AI解析出来的海量动作，直接驱动2D角色生产视频</p>
      </div>

      <div class="comparison">
        <div class="list">
          <div class="video">
            <video
              loop
              muted
              autoplay
              playsinline
              x5-playsinline
              webkit-playsinline="true"
              crossorigin="anonymous"
              :poster="comparisonData.sourcePoster"
              type="video/mp4"
              :src="comparisonData.sourceVideo"
              x5-video-player-type="h5-page"
            ></video
            >原动作视频
          </div>

          <div class="video video-right">
            <video
              loop
              muted
              autoplay
              playsinline
              x5-playsinline
              webkit-playsinline="true"
              crossorigin="anonymous"
              :poster="comparisonData.aigcPoster"
              type="video/mp4"
              :src="comparisonData.aigcVideo"
              x5-video-player-type="h5-page"
            ></video
            >AI生产视频
          </div>
        </div>

        <div class="driving-img">
          <img :src="comparisonData.userImg" />2D角色图片
        </div>
      </div>
    </section>

    <section class="container">
      <hr />
    </section>

    <section class="text_to_video container">
      <h2>更进一步：输入脚本直接生成视频</h2>
      <p>想象一下，输入你的内容脚本，直接生成消费级的剧情视频内容</p>

      <div class="compositional">
        <div class="text_to_video_left_column">
          <!-- <div class="tab_container">
            <div
              v-for="item in Object.keys(tabData)"
              :class="`tab ${seleteTab === item ? 'selected' : ''}`"
              :key="item"
              @click="onTab(item)"
            >
              <div class="tab_text">{{ item }}</div>
              <div class="separator"></div>
            </div>
          </div> -->

          <div
            class="text_to_video_examples"
            v-for="(item, index) in tabData[seleteTab]"
            :key="item.text"
          >
            <div
              :class="`text_to_video_example text_container ${
                seleteItem?.text === item?.text ? 'selected' : ''
              }`"
              @click="onItem(item, index)"
            >
              <div class="text_to_video_example text_example">
                {{ item.text }}
              </div>

              <div class="arrow">
                <img
                  src="~/assets/img/arrow-right-pano.png"
                  width="40"
                  height="40"
                />
              </div>
            </div>
          </div>
        </div>

        <div class="text_to_video_image_container">
          <video
            muted
            autoplay
            playsinline
            x5-playsinline
            webkit-playsinline="true"
            class="w-full object-cover"
            id="text2Video"
            :src="seleteItem.url"
            type="video/mp4"
            :poster="seleteItem.poster"
            x5-video-player-type="h5-page"
          ></video>
        </div>
      </div>
    </section>

    <footer>
      <div class="footer-container">
        <div class="qcode">
          <div>
            <img src="~/assets/img/qcode.png" alt="" />
            <span id="text">微信扫码加入社群</span>
          </div>
        </div>
        <div class="content">
          <div class="copyright">
            <span>CopyRight © 2023 北京深度图灵科技有限公司 </span>
            <br />
            <span>ICP备案号：京ICP备2022032842号-1</span>
          </div>
          <div class="contact">
            <span>联系电话：010-64126768</span>&nbsp;&nbsp;&nbsp;&nbsp;
            <span>联系邮箱：notice@deep-turing.com</span><br />
            <p></p>
          </div>
        </div>
      </div>
    </footer>
  </div>
</template>

<script lang="ts" setup>
import { ref, nextTick, onMounted } from "vue";
import { useState } from "nuxt/app";
import { useAsset } from "~/lib/util";

useHead({
  title: "迎接视频制作新时代",
  meta: [
    {
      property: "og:title",
      content: `北京深度图灵科技有限公司 - 迎接视频制作新时代`,
    },
    {
      name: "robots",
      content: "index,follow",
    },
    { property: "site_name", content: "AIGC-北京深度图灵科技有限公司" },
    { property: "al:ios:app_name", content: "AIGC-北京深度图灵科技有限公司" },
    {
      property: "al:android:app_name",
      content: "AIGC-北京深度图灵科技有限公司",
    },
    {
      property: "apple-mobile-web-app-title",
      content: "AIGC-北京深度图灵科技有限公司",
    },
    { property: "og:type", content: "article" },
    { property: "og:site_name", content: "AIGC-北京深度图灵科技有限公司" },
  ],
  link: [
    {
      rel: "dns-prefetch",
      href: "//cdn.visionstory.cn",
    },
  ],
  script: [
    {
      src: "/js/report.js",
      body: true,
    },{
      src: "http://res.wx.qq.com/open/js/jweixin-1.0.0.js",
      body: true,
    }
  ],
});

const comparisonData = {
  sourceVideo: "//cdn.visionstory.cn/www/compare_source.mp4",
  sourcePoster: useAsset("/assets/img/compare_source.jpg"),
  aigcVideo: "//cdn.visionstory.cn/www/compare_aigc.mp4",
  aigcPoster: useAsset("/assets/img/compare_aigc.jpg"),
  userImg: "//cdn.visionstory.cn/www/compare_reference.png",
};

const tabData: any = {
  国漫风: [
    {
      text: "主人公在空旷的野地上练功，缓慢且沉稳",
      poster: useAsset("/assets/img/text2video_1.jpg"),
      url: "//cdn.visionstory.cn/www/text2video_1.mp4",
    },
    {
      text: "主人公独自一人在操场上打拳击，凶恨且愤怒",
      poster: useAsset("/assets/img/text2video_2.jpg"),
      url: "//cdn.visionstory.cn/www/text2video_2.mp4",
    },
    {
      text: "主人公在聚光灯照射的舞台下跳中国古典舞",
      poster: useAsset("/assets/img/text2video_3.jpg"),
      url: "//cdn.visionstory.cn/www/text2video_3.mp4",
    },
  ],
};

interface SelectItem {
  text: string;
  img: String;
}

const isPopShow = useState("isPopShow", () => false);
const seleteTab = useState("seleteTab", () => Object.keys(tabData)[0]);
const seleteItem = useState("seleteItem", () => tabData?.[seleteTab.value][0]);

const onPop = () => {
  isPopShow.value = !isPopShow.value;
};

const onTab = (tab: string) => {
  seleteTab.value = tab;
  seleteItem.value = tabData?.[seleteTab.value][0];
};

const onItem = (item: SelectItem, index?: number) => {
  seleteItem.value = item;
};

const playNextVideo = () => {
  for (let i = 0; i < tabData?.[seleteTab.value].length; i++) {
    const item = tabData?.[seleteTab.value][i];

    if (item?.text === seleteItem?.value?.text) {
      const index = i === tabData?.[seleteTab.value].length - 1 ? 0 : i + 1;
      onItem(tabData?.[seleteTab.value][index]);

      break;
    }
  }
};

onMounted(() => {
  if (process.client) {
    const video: any = document?.getElementById("text2Video");
    video.addEventListener(
      "ended",
      function () {
        playNextVideo();
      },
      false
    );
  }
});

nextTick(()=>{
  const video = document.querySelectorAll("video")[0];
  document.addEventListener("WeixinJSBridgeReady", function () {
     video.play()
}, false);
})
</script>

<style lang="scss">
body {
  font-family: "Optimistic Text", "Helvetica", "Helvetica Neue", "Arial",
    "sans-serif";
  font-style: normal;
  padding: 0;
  margin: 0px;
  background-color: rgb(255, 255, 255);
  color: rgb(26, 26, 26);
}

a {
  text-decoration: none;
  color: #ffffff;
}

hr {
  background-color: #cbd2d9;
  height: 1px;
  border: 0;
}

p {
  font-family: "Optimistic Text";
  font-style: normal;
  font-weight: 400;
  font-size: 22px;
  line-height: 28px;
  color: rgb(26, 26, 26);
  margin: 0px;
  padding: 0px;
}

p.sm {
  font-family: "Optimistic Text";
  font-style: normal;
  font-weight: 400;
  font-size: 18px;
  line-height: 24px;
  color: #1c2b33;
  margin: 0px;
  padding: 0px;
}

p.xsm {
  font-family: "Optimistic Text";
  font-style: normal;
  font-weight: 400;
  font-size: 16px;
  line-height: 21px;
  margin: 0px;
  padding: 0px;
  color: #1c2b33;
}

h1 {
  font-family: "Optimistic Text";
  font-size: 8em;
  padding: 0 0px;
}

h2 {
  font-family: "Optimistic Display";
  font-style: normal;
  font-weight: 500;
  font-size: 40px;
  line-height: 52px;
  padding: 0px;
  padding-bottom: 16px;
  margin: 0px;
}

h3 {
  font-family: "Optimistic Text";
  font-style: normal;
  font-weight: 700;
  font-size: 24px;
  line-height: 31px;
}

.text_container {
  cursor: pointer;
}

.pop {
  background-color: rgba(0, 0, 0, 0.8);
  width: 100%;
  height: 100%;
  position: fixed;
  z-index: 99999;
  cursor: pointer;

  .bg {
    $width: 15rem;
    width: $width;
    margin-left: calc(-1 * $width / 2);
    margin-top: calc(-1 * $width / 2);
    left: 50%;
    top: 50%;
    position: absolute;
    -webkit-animation: sacleImg 0.5s ease-out;
    animation: sacleImg 0.5s ease-out;

    @keyframes sacleImg {
      0% {
        transform: scale(0.5);
      }

      80% {
        transform: scale(1);
      }
    }

    img {
      $width: 15rem;
      width: $width;
    }

    p {
      text-align: center;
      color: #fff;
      margin-top: 15px;
    }
  }
}

header {
  position: relative;
  overflow: hidden;
  margin-bottom: 5rem;

  video {
    width: 100%;
    height: 100%;
    object-fit: cover;
    position: absolute;
    vertical-align: middle;
  }

  .mask {
    width: 100%;
    height: 100%;
    --tw-gradient-to: #00000069;
    --tw-gradient-from: #4e4d4da3;
    --tw-gradient-stops: var(--tw-gradient-from),
      var(--tw-gradient-to, rgba(78, 77, 77, 0));
    background-image: linear-gradient(to bottom, var(--tw-gradient-stops));
    position: absolute;
  }

  .content {
    position: relative;
    text-align: center;
    width: 100%;
    color: #fff;
    padding: 8rem 0;
    --tw-gradient-from: #4e4d4da3;
    --tw-gradient-stops: var(--tw-gradient-from),
      var(--tw-gradient-to, rgba(78, 77, 77, 0));
    background-image: linear-gradient(to bottom, var(--tw-gradient-stops));
    --tw-text-opacity: 1;
    color: rgba(255, 255, 255, var(--tw-text-opacity));

    .title {
      font-size: 6vw;
      text-shadow: 2px -1px 5px rgba(0, 0, 0, 0.27);
    }

    .summary {
      font-size: 2vw;
      text-shadow: 2px -1px 5px rgba(0, 0, 0, 0.27);
    }

    .btn {
      font-size: 2vw;
      color: #fff;
      padding: 0.5vw 2vw;
      display: inline-block;
      border-radius: 10vw;
      margin-top: 5vw;
      vertical-align: middle;
      background: #1877f2;
      cursor: pointer;

      span {
        display: flex;
      }

      i {
        display: inline-block;
        width: 2.9vw;
        height: 2.9vw;
        background-image: url("~/assets/img/icon_qcode_sao.png");
        background-size: contain;
        background-repeat: no-repeat;
        margin-right: 5px;
      }
    }
  }
}

.padding-top-5rem {
  padding-top: 5rem;
}

.container {
  max-width: 1470px;
  padding-left: 40px;
  padding-right: 40px;
  padding-bottom: 80px;
  background-color: rgb(255, 255, 255);
  color: rgb(26, 26, 26);
}

.compositional {
  gap: 55px;
  justify-content: space-between;
}

.tab_container {
  display: flex;
}

.image_to_video .tab_container {
  margin-bottom: 36px;
}

.image_to_video .compositional .arrow {
  align-items: center;
}

div.tab {
  width: 170px;
  cursor: pointer;
}

div.tab_text {
  font-weight: 700;
  font-size: 24px;
  line-height: 31px;
  text-align: center;
  color: #bcc0c4;
  margin-top: 16px;
  margin-bottom: 19px;
}

.selected div.tab_text {
  color: #1c2b33;
}

.text_container:hover {
  background-color: #f0f1f2;
}

.tab div.separator {
  width: 100%;
  height: 3px;
  background-color: #bcc0c4;
}

.tab.selected div.separator {
  background-color: #1c2b33;
}

div.tab.tabimage {
  width: 255px;
}

.hidden {
  display: none !important;
}

.text_to_video_left_column {
  display: flex;
  flex-direction: column;
}

.text_to_video_examples {
  display: flex;
  flex-direction: column;
}

.text_to_video_example.text_container {
  display: flex;
  align-items: center;
  justify-content: space-between;
  height: 138px;
  gap: 24px;
  padding: 0 30px;
}

.text_to_video_example .text_example {
  font-weight: 500;
  font-size: 20px;
  line-height: 31px;
  color: #bcc0c4;
}

.text_to_video_example.selected div.text_example {
  color: #1c2b33;
}

.text_to_video .arrow {
  visibility: hidden;
}

.text_to_video .selected .arrow {
  visibility: visible;
}

.text_to_video_image_container {
  width: 512px;
  height: 512px;
  padding-top: 40px;
}

.text_to_video_image_container {
  video,
  img {
    height: 100%;
    width: 100%;
    max-width: 512px;
    max-height: 512px;
  }
}

.mode-title {
  div {
    font-size: 2.25rem;
    line-height: 2.5rem;
  }

  p {
    font-size: 1.125rem;
    line-height: 1.75rem;
    padding-bottom: 1.25rem;
  }
}

.source-to-generated {
  .comparison {
    position: relative;
    padding-top: 2.5rem;
    color: #6d6d6d;
    font-size: 14px;
    line-height: 24px;

    .list {
      display: flex;
      padding-top: 2rem;

      .video {
        width: 50%;

        video {
          max-width: 100%;
          width: 100%;
          height: auto;
        }
      }

      .video-right {
        text-align: right;
        --tw-space-x-reverse: 0;
        margin-right: calc(1.5rem * var(--tw-space-x-reverse));
        margin-left: calc(1.5rem * calc(1 - var(--tw-space-x-reverse)));
      }
    }

    .driving-img {
      $width: 14rem;
      margin: auto;
      left: 50%;
      width: $width;
      margin-left: calc(-1 * $width / 2);
      bottom: calc(-1 * $width / 6);
      position: absolute;
      text-align: center;

      img {
        max-width: max-content;
        margin: auto;
        display: block;
        height: calc($width / 2);
      }
    }
  }
}

.text_to_video {
  p {
    padding-bottom: 40px;
  }
}

footer {
  background: #000;
  color: #fff;
  text-align: center;
  font-size: 12px;
  padding: 50px 0;

  .qcode {
    width: 150px;
    margin: 0 auto;
    text-align: center;

    img {
      width: 100%;
      margin-bottom: 10px;
    }

    span {
      font-size: 12px;
    }
  }

  .content {
    margin-top: 30px;

    .contact {
      margin-top: 10px;
    }
  }
}

@media only screen and (max-width: 1200px) {
}

@media only screen and (max-width: 992px) {
  .container {
    padding-left: 40px;
    padding-right: 40px;
  }

  .compositional {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 55px;
  }

  h2 {
    font-size: 30px;
  }

  h3 {
    font-size: 24px;
  }

  div.tab {
    flex: 1;
    width: 130px;
  }

  .tab_container {
    align-items: stretch;
  }

  .text_to_video .tab_text {
    font-size: 20px;
  }

  .text_to_video_image_container {
    width: 100%;
    max-width: 512px;
    height: auto;
  }

  .text_to_video_image_container img {
    height: 100%;
    width: 100%;
    max-width: 512px;
    max-height: 512px;
  }

  .tab.tabimage .tab_text {
    font-size: 20px;
  }

  .text_to_video .tab_text {
    font-size: 20px;
  }

  .text_to_video_example.text_container {
    height: 100px;
    gap: 0px;
  }

  .text_to_video_example .text_example {
    line-height: 22px;
    font-size: 15px;
  }

  .text_to_video .arrow {
    display: none;
  }

  div.arrow {
    width: 40px;
    height: 40px;
    transform: rotate(90deg);
  }

  .text_to_video_image_container {
    width: 100%;
    max-width: 512px;
    height: auto;
  }

  .text_to_video_image_container img {
    height: 100%;
    width: 100%;
    max-width: 512px;
    max-height: 512px;
  }

  div.compositional {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 55px;
  }

  div.compositional div.text {
    width: 50%;
    margin: 0;
  }
}

@media only screen and (max-width: 576px) {
  header {
    .content {
      padding: 8rem 0;

      .title {
        font-size: 15vw;
      }

      .summary {
        font-size: 3vw;
      }

      .btn {
        font-size: 4vw;
        padding: 1vw 5vw;
        border-radius: 10vw;
        margin-top: 5vw;

        i {
          width: 6vw;
          height: 6vw;
        }
      }
    }
  }

  .container {
    margin: 0 auto;
    max-width: 1470px;
    padding-left: 24px;
    padding-right: 24px;
    padding-bottom: 80px;
  }

  .reset-container {
    padding-bottom: 0 !important;
    padding-top: 0 !important;
  }

  div.tab {
    width: 100px;
  }

  .source-to-generated {
    font-size: 12px;

    .comparison {
      .driving-img {
        $width: 8rem;
        width: $width;
        margin-left: calc(-1 * $width / 2);
        bottom: calc(-1 * $width / 6);

        img {
          height: calc($width / 2);
        }
      }
    }
  }
}

@media only screen and (max-width: 376px) {
  .container {
    margin: 0 auto;
    max-width: 1470px;
    padding-left: 24px;
    padding-right: 24px;
    padding-bottom: 80px;
  }

  p {
    font-size: 20px;
    padding-bottom: 20px;
  }

  h2 {
    font-size: 24px;
    line-height: 36px;
  }

  h3 {
    font-size: 20px;
  }
}

@media only screen and (min-width: 992px) {
  header {
    .content {
      padding: 8rem 0;
    }
  }

  .container {
    margin: 0 auto;
    max-width: 1470px;
    padding-left: 40px;
    padding-right: 40px;
    padding-bottom: 150px;
  }

  .compositional {
    display: flex;
    flex-wrap: wrap;
  }

  .text_to_video_left_column {
    width: 550px;
  }
}

@media only screen and (min-width: 992px) and (max-width: 1360px) {
  .container {
    margin: 0 auto;
    max-width: 1470px;
    padding-left: 80px;
    padding-right: 80px;
    padding-bottom: 80px;
  }

  .project_description {
    padding: 60px 80px;
  }

  .compositional {
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
  }
}

@media only screen and (min-width: 1360px) and (max-width: 1470px) {
  .container {
    margin: 0 auto;
    max-width: 1470px;
    padding-left: 80px;
    padding-right: 80px;
    padding-bottom: 80px;
  }

  .project_description {
    padding: 60px 80px;
  }

  .compositional {
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
  }
}

@media only screen and (min-width: 1470) and (max-width: 1999px) {
  .container {
    max-width: 1470px;
    padding-left: 80px;
    padding-right: 80px;
    margin-right: auto;
    margin-left: auto;
    padding-bottom: 80px;
  }

  .compositional {
    display: flex;
    flex-wrap: wrap;
  }
}

@media only screen and (min-width: 2000px) {
  .compositional {
    display: flex;
    flex-wrap: wrap;
  }
}
</style>
