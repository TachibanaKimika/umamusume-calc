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
        $colors: (#641839, #DAD7FC);

        @for $i from 1 through $amount {
            &:nth-child(#{$i}) {
                color: nth($colors, random(length($colors)));
                top: random(100) * 1%;
                left: random(100) * 1%;
                animation-duration: (random($animationDuration * 10) / 10) * 1s + 10s;
                animation-delay: random(($animationDuration + 3s) * 10) / 10 * -1s;
                transform-origin: (random(50) - 25) * 1vw (random(50) - 25) * 1vh;
                $blurRadius: (random() + 0) * $particleSize * 0;
                $x: if(random() > 0.5, -1, 1);
                box-shadow: ($particleSize * 1 * $x) 0 $blurRadius currentColor;
            }
        }
    }

    @keyframes move {
        100% {
            transform: translate3d(0, 0, 1px) rotate(360deg);
        }
    }
</style>