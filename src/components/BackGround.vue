<!--
 * @Author: Akarichan
 * @LastEditors: Akarichan
-->
<template>
    <div class="area-bg">
        <div class="particle">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
        </div>
    </div>
</template>
<script>
    export default {
        name: 'BackGround'
    }
</script>

<style lang="scss" scoped>
    .area-bg {
        position: fixed;
        top: 0;

        .particle {
            width: 100vw;
            height: 100vh;
        }
    }

    $particleSize: 5vmin;
    $animationDuration: 6s;
    $amount: 15;

    .particle span {
        width: $particleSize;
        height: $particleSize;
        backface-visibility: hidden;
        position: absolute;
        animation-name: move;
        animation-duration: $animationDuration;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        $colors: (#88ffeb, #ffe48c);
        $backgroundImg: (linear-gradient(180deg, rgb(255, 189, 238), rgb(158, 173, 255)), linear-gradient(135deg, rgb(255, 230, 184), rgb(175, 255, 163)));
        
        @for $i from 1 through $amount {
            &:nth-child(#{$i}) {
                // color: nth($colors, random(length($colors)));
                background-image:radial-gradient(rgba(0, 0, 0, 0) 20%, rgba(0, 0, 0, 0.1) 80%), nth($backgroundImg, random(length($backgroundImg)));
                // background-image: ;
                top: random(100) * 1%;
                left: random(100) * 1%;
                animation-duration: (random($animationDuration * 10) / 10) * 1s + 10s;
                animation-delay: random(($animationDuration + 3s) * 10) / 10 * -1s;
                transform-origin: (random(50) - 25) * 1vw (random(50) - 25) * 1vh;
                $blurRadius: (random() + 0) * $particleSize * 0;
                $x: if(random() > 0.5, -1, 1);
                // box-shadow: ($particleSize * 1 * $x) 0 $blurRadius currentColor;
            }
        }
    }

    @keyframes move {
        100% {
            transform: translate3d(0, 0, 1px) rotate(360deg);
        }
    }
</style>