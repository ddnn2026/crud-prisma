FROM node:18-alpine AS builder  
 
WORKDIR /app

COPY package*.json ./
COPY prisma ./prisma/
 
RUN npm install

COPY . . 

RUN npm run build

RUN npx prisma generate

FROM node:18-alpine

COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package*.json ./

 
CMD ["npm", "run", "start:dev" ]


# FROM node:18-alpine As development
# WORKDIR /usr/src/app
# COPY --chown=node:node package*.json ./
# RUN npm ci
# COPY --chown=node:node . .
# USER node

# FROM node:18-alpine As build
# WORKDIR /usr/src/app
# COPY --chown=node:node package*.json ./
# COPY --chown=node:node --from=development /usr/src/app/node_modules ./node_modules
# COPY --chown=node:node . .
# RUN npx prisma generate
# COPY . .
# RUN npm run build
# ENV NODE_ENV production
# USER node

# FROM node:18-alpine As production
# COPY --chown=node:node --from=build /usr/src/app/ ./
# COPY --chown=node:node --from=build /usr/src/app/dist ./dist
# CMD ["npm", "run","start:prod"] 