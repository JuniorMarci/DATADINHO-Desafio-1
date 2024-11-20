// Definindo o canvas e contexto
const canvas = document.getElementById('gameCanvas');
const ctx = canvas.getContext('2d');

// Definir o tamanho do canvas
canvas.width = 800;
canvas.height = 600;

// Definir o tamanho do cenário
const levelWidth = 3000;
const levelHeight = 1000;

// Variáveis de jogo
let cameraX = 0; // Posição da câmera no eixo X
let cameraY = 0; // Posição da câmera no eixo Y
const gravity = 0.5; // Gravidade para o personagem

// Definindo o personagem
const player = {
    x: 100, // Posição inicial no eixo X
    y: 500, // Posição inicial no eixo Y
    width: 50,
    height: 50,
    speed: 5,
    dx: 0, // Velocidade horizontal
    dy: 0, // Velocidade vertical
    jumping: false,
    life: 3 // Vida do jogador
};

// Definindo as plataformas no cenário maior
const platforms = [
    { x: 0, y: canvas.height - 1, width: levelWidth, height: 20 }, // Chão
    { x: 150, y: canvas.height - 100, width: 200, height: 20 },
    { x: 100, y: canvas.height - 200, width: 200, height: 20 },
    { x: 399, y: canvas.height - 300, width: 200, height: 20 },  // Exemplo de plataforma no meio do cenário
    { x: 2500, y: canvas.height - 50, width: 200, height: 20 }   // Outra plataforma mais à direita
];

// Definindo inimigos
const enemies = [
    { x: 600, y: canvas.height - 80, width: 50, height: 50, type: 'damage' },  // Inimigo que causa dano
    { x: 1200, y: canvas.height - 80, width: 50, height: 50, type: 'kill' }    // Inimigo que morre ao ser saltado
];

// Função para desenhar o personagem
function drawPlayer() {
    ctx.fillStyle = 'red';
    ctx.fillRect(player.x - cameraX, player.y - cameraY, player.width, player.height);
}

// Função para desenhar as plataformas
function drawPlatforms() {
    ctx.fillStyle = 'green';
    platforms.forEach(platform => {
        ctx.fillRect(platform.x - cameraX, platform.y - cameraY, platform.width, platform.height);
    });
}

// Função para desenhar os inimigos
function drawEnemies() {
    enemies.forEach(enemy => {
        ctx.fillStyle = enemy.type === 'damage' ? 'blue' : 'purple';
        ctx.fillRect(enemy.x - cameraX, enemy.y - cameraY, enemy.width, enemy.height);
    });
}

// Função para atualizar a física do personagem
function updatePlayer() {
    // Atualizando a posição do personagem
    player.x += player.dx;
    player.y += player.dy;

    // Gravidade
    if (player.y + player.height < canvas.height) {
        player.dy += gravity; // Aplica a gravidade
    } else {
        player.dy = 0;
        player.jumping = false;
        player.y = canvas.height - player.height; // Para ele não cair fora da tela
    }
	
	

	// Gravidade para inimigos

    enemies.forEach(enemy => {
  
	  if (enemy.y + enemy.height < canvas.height) {
        enemy.y += gravity; // Aplica a gravidade
    } else {
        enemy.y = canvas.height - enemy.height; // Para ele não cair fora da tela
    }
    })	

	
	
	
	
	
	


    // Movimentação lateral
    if (player.x < 0) player.x = 0;
    if (player.x + player.width > levelWidth) player.x = levelWidth - player.width;
}

// Função para atualizar a posição da câmera
function updateCamera() {
    // A câmera segue o jogador, mas dentro do limite do cenário
    cameraX = player.x - canvas.width / 2 + player.width / 2;
    cameraY = player.y - canvas.height / 2 + player.height / 2;

    // Limitar a câmera para não sair do cenário
    if (cameraX < 0) cameraX = 0; // Câmera não pode sair para a esquerda
    if (cameraY < 0) cameraY = 0; // Câmera não pode sair para cima
    if (cameraX > levelWidth - canvas.width) cameraX = levelWidth - canvas.width; // Limite à direita
    if (cameraY > levelHeight - canvas.height) cameraY = levelHeight - canvas.height; // Limite para baixo
}

// Função para verificar colisões com plataformas
function checkCollisions() {
    platforms.forEach(platform => {
        if (
            player.x + player.width > platform.x &&
            player.x < platform.x + platform.width &&
            player.y + player.height <= platform.y &&
            player.y + player.height + player.dy >= platform.y
        ) {
            player.y = platform.y - player.height;
            player.dy = 0;
            player.jumping = false;
        }
    });
}

// Função para verificar colisões com inimigos
function checkEnemyCollisions() {
    enemies.forEach((enemy, index) => {
        // Inimigo que causa dano (tipo 'damage')
        if (
            player.x + player.width > enemy.x &&
            player.x < enemy.x + enemy.width &&
            player.y + player.height > enemy.y && 
            player.y < enemy.y + enemy.height
        ) {
            if (enemy.type === 'damage') {
                player.life--; // Reduz a vida do jogador
                console.log('Vida do jogador:', player.life);
				
				player.x += player.dx + 10
				
				if(player.x < enemy.x) { player.x = enemy.x - enemy.height; }
				if(player.x > enemy.x) { player.x = enemy.x + enemy.height; }

                // Resetando a posição do jogador após o dano
                //player.x = 100; // Volta para o início
                //player.y = 500;
            }
			
			if (enemy.type === 'kill') {
				console.log(enemy.type === 'kill')
				console.log(enemy.y)
				console.log(player.y)
			}

            // Inimigo que morre quando o jogador pula sobre ele (tipo 'kill')
            if (enemy.type === 'kill' && (player.y+2) <= enemy.y) {
                // "Matar" o inimigo
                enemies.splice(index, 1); // Remove o inimigo da lista
                console.log('Inimigo morto!');
            }
        }
    });
}

// Variáveis para controle
let rightPressed = false;
let leftPressed = false;
let upPressed = false;

// Detectando teclas pressionadas
document.addEventListener('keydown', (e) => {
    if (e.key === 'ArrowRight') rightPressed = true;
    if (e.key === 'ArrowLeft') leftPressed = true;
    if (((e.key === 'ArrowUp') || (e.key === ' ')) && (!player.jumping)) {
        player.dy = -10; // Força para pular
        player.jumping = true;
    }
});

document.addEventListener('keyup', (e) => {
    if (e.key === 'ArrowRight') rightPressed = false;
    if (e.key === 'ArrowLeft') leftPressed = false;
});

// Atualizar movimento do personagem
function updateMovement() {
    if (rightPressed) player.dx = player.speed;
    else if (leftPressed) player.dx = -player.speed;
    else player.dx = 0;
}

// Função principal do jogo
function gameLoop() {
    // Limpar a tela
    ctx.clearRect(0, 0, canvas.width, canvas.height);

    // Atualizar jogador e câmera
    updateMovement();
    updatePlayer();
    checkCollisions();
    checkEnemyCollisions();
    updateCamera();

    // Desenhar elementos
    drawPlatforms();
    drawPlayer();
    drawEnemies();

    // Repetir o loop
    requestAnimationFrame(gameLoop);
}

// Iniciar o jogo
gameLoop();
